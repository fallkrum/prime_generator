//
//  HistoryViewController.h
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "HistoryRequest.h"

@class HistoryViewController;

@protocol HistoryViewControllerDelegate <NSObject>
- (void)historyViewController:(HistoryViewController *)controller
               didSelectEvent:(id)event;
@end

@interface HistoryViewController :
UIViewController <UITableViewDataSource, UITableViewDelegate>{
@private
    NSFetchedResultsController                      *fetchedController;
    __weak id <HistoryViewControllerDelegate>       delegate;
}


@property (nonatomic, weak) id <HistoryViewControllerDelegate> delegate;

@end
