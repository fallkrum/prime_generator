//
//  PrimeGenerationFlow.h
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "PrimeRequest.h"
#import "LimitRequest.h"
#import "History.h"
#import "PrimeGenerator.h"

@interface PrimeGenerationFlow : NSOperation {
@private
    __weak NSManagedObjectContext       *context;
    PrimeGenerator                      *primeGenerator;
    id                                  result;
    NSInteger                           limit;
}

@property (nonatomic, weak) NSManagedObjectContext *context;
@property (nonatomic, readonly) id result;

- (id)initWithLimit:(NSInteger)limit;

@end
