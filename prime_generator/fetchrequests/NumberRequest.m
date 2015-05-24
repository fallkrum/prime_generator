//
//  NumberRequest.m
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "NumberRequest.h"

@implementation NumberRequest

- (id)init {
    self = [super init];
    
    entityName = [Number className];
    
    return self;
}

- (id)initWithNumber:(NSInteger)number {
    self = [self init];
    
    predicate = [NSPredicate predicateWithFormat:@"value == %i", number];
    
    return self;
}



@end
