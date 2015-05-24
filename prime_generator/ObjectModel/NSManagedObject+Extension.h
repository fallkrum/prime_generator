//
//  NSManagedObject+Extension.h
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Extension)
+ (NSString *)className;
+ (NSManagedObject *)newEntityInContext:(NSManagedObjectContext *)context;
@end
