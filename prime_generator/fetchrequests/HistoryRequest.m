//
//  HistoryRequest.m
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "HistoryRequest.h"

@implementation HistoryRequest

- (id)init {
    self = [super init];
    
    entityName = [History className];
    
    NSSortDescriptor *sortDescriptor =
    [[NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
    
    sortDescriptors = @[sortDescriptor];
    
    return self;
}




@end
