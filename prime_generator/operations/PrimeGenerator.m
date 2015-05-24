//
//  PrimeGenerator.m
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "PrimeGenerator.h"

@implementation PrimeGenerator

@synthesize primeMask;
@synthesize limit;

- (id)initWithLimit:(NSInteger)_limit {
    self = [self init];
    
    limit = _limit;
    
    primeMask = malloc(limit * sizeof(bool));
    memset(primeMask, 1, limit * sizeof(bool));
    primeMask[0] = false;
    
    return self;
}


- (void)main {
    NSInteger count = sqrt(limit);
    
    for (NSInteger i = 2; i <= count; i ++) {
        if(self.isCancelled) return;
        
        NSInteger currentIndex = i * i;
        
        while (currentIndex <= limit) {
            if(self.isCancelled) return;
            
            primeMask[currentIndex] = false;
            
            currentIndex += i;
        }
    }
}


- (void)dealloc {
    free(primeMask);
}

@end
