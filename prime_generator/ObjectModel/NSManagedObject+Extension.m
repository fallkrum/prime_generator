//
//  NSManagedObject+Extension.m
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "NSManagedObject+Extension.h"
#import <objc/runtime.h>

@implementation NSManagedObject (Extension)

+ (NSString *)className {
    const char *class_name = class_getName([self class]);
    NSString *className = [NSString stringWithCString:class_name
                                             encoding:NSUTF8StringEncoding];
    
    return className;
}

+ (NSManagedObject *)newEntityInContext:(NSManagedObjectContext *)context {
    NSString *className = [self className];
    
    NSManagedObject *entity =
    [NSEntityDescription insertNewObjectForEntityForName: className
                                  inManagedObjectContext:context];
    
    return entity;
}

@end
