//
//  History.h
//  
//
//  Created by Ilya Bukonkin on 5/24/15.
//
//

#import <Foundation/Foundation.h>
#import "NSManagedObject+Extension.h"


@interface History : NSManagedObject

@property (nonatomic, retain) NSNumber * event;
@property (nonatomic, retain) NSDate * date;

@end
