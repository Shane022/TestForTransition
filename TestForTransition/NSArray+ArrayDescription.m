//
//  NSArray+ArrayDescription.m
//  TestForTransition
//
//  Created by Shane on 2020/6/22.
//  Copyright © 2020 Shane. All rights reserved.
//

#import "NSArray+ArrayDescription.h"

@implementation NSArray (ArrayDescription)

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.firstObject];
}

@end
