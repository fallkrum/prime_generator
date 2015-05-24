//
//  PrimeGenerationFlow.m
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "PrimeGenerationFlow.h"

@implementation PrimeGenerationFlow

@synthesize context;
@synthesize result;

- (id)initWithLimit:(NSInteger)_limit {
    self = [super init];
    
    limit = _limit;
    
    return self;
}

- (void)main {
 
    /*
     check if allready in the storage
     */
    FetchRequest *request =
    [[LimitRequest alloc] initWithNumber:limit];
    
    Limit *number = [[request executeInContext:context] firstObject];
    if(number) {
        result = [number objectID];
        
        return;
    }
    
    if(self.isCancelled) return;
    
    
    
    /*
     generate prime number mask
     */
    primeGenerator = [[PrimeGenerator alloc] initWithLimit:limit];
    [primeGenerator start];
    
    if(self.isCancelled) return;
    
    
    
    /*
     create storage data structures and relationships
     */
    number = [Limit newEntityInContext:context];
    number.value = [NSNumber numberWithInteger: limit];
   
    for (NSInteger i = 0; i < primeGenerator.limit; i ++) {
        if(!primeGenerator.primeMask[i]) continue;
        
        if(self.isCancelled) {
            [context reset];
            return;
        }
        
        request =
        [[PrimeRequest alloc] initWithNumber:i];
        Prime *prime = [[request executeInContext:context] firstObject];
        
        if(!prime) {
            prime = [Prime newEntityInContext:context];
            prime.value = [NSNumber numberWithInteger: i];
        }
        
        [prime addLimitsObject:number];
    }
    
    [context save:nil];
    result = [number objectID];
    [context reset];
}

- (void)cancel {
    [super cancel];
    
    [primeGenerator cancel];
}

@end
