//
//  LimitRequest.m
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "LimitRequest.h"

@implementation LimitRequest

- (id)init {
    self = [super init];
    
    entityName = [Limit className];
    
    return self;
}

@end
