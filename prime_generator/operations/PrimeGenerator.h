//
//  PrimeGenerator.h
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PrimeGenerator : NSOperation {
@private
    NSInteger           limit;
    bool                *primeMask;
}

@property (nonatomic, readonly) bool * primeMask;
@property (nonatomic, readonly) NSInteger limit;

- (id)initWithLimit:(NSInteger)limit;

@end
