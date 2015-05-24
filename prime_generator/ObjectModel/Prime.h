//
//  Prime.h
//  
//
//  Created by Ilya Bukonkin on 5/24/15.
//
//

#import <Foundation/Foundation.h>
#import "Number.h"

@class Limit;

@interface Prime : Number

@property (nonatomic, retain) NSSet *limits;
@end

@interface Prime (CoreDataGeneratedAccessors)

- (void)addLimitsObject:(Limit *)value;
- (void)removeLimitsObject:(Limit *)value;
- (void)addLimits:(NSSet *)values;
- (void)removeLimits:(NSSet *)values;

@end
