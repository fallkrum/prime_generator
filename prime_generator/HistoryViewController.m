//
//  HistoryViewController.m
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryCell.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HistoryRequest *request = [HistoryRequest new];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    fetchedController =
    [appDelegate fetchResultsControllerForRequest:request];
    [fetchedController performFetch:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [fetchedController.fetchedObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryCell"];
    
    if(!cell)
        cell =
        [[[NSBundle mainBundle] loadNibNamed:@"HistoryCell" owner:nil options:nil]
         objectAtIndex:0];
    
    History *history = [fetchedController.fetchedObjects objectAtIndex:indexPath.row];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [formatter stringFromDate:history.date];
    
    cell.limitLabel.text = [NSString stringWithFormat:@"%@", history.event];
    cell.dateLabel.text = dateString;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    History *history = [fetchedController.fetchedObjects objectAtIndex:indexPath.row];
    
    if([delegate respondsToSelector:@selector(historyViewController:didSelectEvent:)])
        [delegate historyViewController:self didSelectEvent:history.event];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
