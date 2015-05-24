//
//  PrimeRequest.m
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "PrimeRequest.h"

@implementation PrimeRequest

- (id)init {
    self = [super init];
    
    entityName = [Prime className];
    
    return self;
}

@end
