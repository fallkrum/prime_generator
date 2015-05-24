//
//  NumberRequest.h
//  prime_generator
//
//  Created by Ilya Bukonkin on 5/24/15.
//  Copyright (c) 2015 Ilya Bukonkin. All rights reserved.
//

#import "FetchRequest.h"
#import "Number.h"

@interface NumberRequest : FetchRequest 
- (id)initWithNumber:(NSInteger)number;
@end
