//
//  ViewController.m
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (NSFetchedResultsController *)fetchResultsControllerForLimit:(NSInteger)limit {
    FetchRequest *request = [[LimitRequest alloc] initWithNumber:limit];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSFetchedResultsController *controller =
    [delegate fetchResultsControllerForRequest:request];
    
    controller.delegate = self;
    
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    generationFlows = [NSMutableArray new];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [textField resignFirstResponder];
    
    HistoryViewController *viewController = segue.destinationViewController;
    viewController.delegate = self;
}


#pragma mark - Help routines
- (void)generationFlowDidFinish:(PrimeGenerationFlow *)generationFlow {
    [generationFlows removeObject:generationFlow];
}

- (void)hideActivityIndicator {
    [UIView animateWithDuration:0.5
                     animations:^{
                         activityView.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         [activityView startAnimating];
                     }];
}

- (void)displayPrimesForLimit:(NSInteger)limit {
    fetchedController = [self fetchResultsControllerForLimit:limit];
    [fetchedController performFetch:nil];
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = delegate.privateObjectContext;
    
    if(![fetchedController.fetchedObjects count]) {
        activityView.alpha = 1.0;
        [activityView startAnimating];
        
        PrimeGenerationFlow *generationFlow =
        [[PrimeGenerationFlow alloc] initWithLimit:limit];
        
        PrimeGenerationFlow *currentFlow = [generationFlows lastObject];
        [currentFlow cancel];
        
        [generationFlows addObject:generationFlow];
        
        __weak ViewController *wself = self;
        
        [context performBlock:^{
            generationFlow.context = context;
            [generationFlow start];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [wself generationFlowDidFinish:generationFlow];
            });
        }];
    } else {
        [self hideActivityIndicator];
        number = [fetchedController.fetchedObjects firstObject];
        [tableView reloadData];
    }
    
}

#pragma mark - NSFetchedResultsController delegate
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self hideActivityIndicator];
    number = [fetchedController.fetchedObjects firstObject];
    [tableView reloadData];
}


#pragma mark - UITextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)_textField {
    NSInteger limit = [textField.text integerValue];
    if(!limit) return NO;
    
    [textField resignFirstResponder];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    History *history =
    [History newEntityInContext:delegate.managedObjectContext];
    history.event = [NSNumber numberWithInteger:limit];
    history.date = [NSDate date];
    
    [self displayPrimesForLimit:limit];
    
    return YES;
}



#pragma mark - UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [number.primes count];
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell)
        cell =
        [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                               reuseIdentifier:@"cell"];
    
    Prime *prime = [number.primes objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", prime.value];
    
    return cell;
}


#pragma mark - HistoryViewController delegate
- (void)historyViewController:(HistoryViewController *)controller didSelectEvent:(id)event {
    [self displayPrimesForLimit:[event integerValue]];
}

@end
