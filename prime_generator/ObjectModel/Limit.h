//
//  Limit.h
//  
//
//  Created by Ilya Bukonkin on 5/24/15.
//
//

#import <Foundation/Foundation.h>
#import "Number.h"

@class Prime;

@interface Limit : Number

@property (nonatomic, retain) NSOrderedSet *primes;
@end

@interface Limit (CoreDataGeneratedAccessors)

- (void)insertObject:(Prime *)value inPrimesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromPrimesAtIndex:(NSUInteger)idx;
- (void)insertPrimes:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removePrimesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInPrimesAtIndex:(NSUInteger)idx withObject:(Prime *)value;
- (void)replacePrimesAtIndexes:(NSIndexSet *)indexes withPrimes:(NSArray *)values;
- (void)addPrimesObject:(Prime *)value;
- (void)removePrimesObject:(Prime *)value;
- (void)addPrimes:(NSOrderedSet *)values;
- (void)removePrimes:(NSOrderedSet *)values;
@end
