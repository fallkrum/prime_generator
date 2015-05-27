//
//  HistoryCell.h
//  prime_generator
//
//  Created by Ilya on 5/27/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryCell : UITableViewCell {
@private
    __weak IBOutlet UILabel         *limitLabel;
    __weak IBOutlet UILabel         *dateLabel;
}


@property (nonatomic, readonly) UILabel *limitLabel;
@property (nonatomic, readonly) UILabel *dateLabel;

@end
