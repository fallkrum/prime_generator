//
//  ViewController.h
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrimeGenerationFlow.h"
#import "HistoryViewController.h"

@interface ViewController : UIViewController
<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource,
NSFetchedResultsControllerDelegate, HistoryViewControllerDelegate> {
    NSFetchedResultsController              *fetchedController;
    NSMutableArray                          *generationFlows;
    Limit                                   *number;
    __weak IBOutlet UITableView             *tableView;
    __weak IBOutlet UIActivityIndicatorView *activityView;
    __weak IBOutlet UITextField             *textField;
}


@end

