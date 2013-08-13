//
//  MPUtil.m
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//

#import "MPUtil.h"

@implementation MPUtil

+ (CGRect)frameFromString:(NSString *)string{
    NSArray *numberArray = [string componentsSeparatedByString:@","];
    if (numberArray.count == 4) {
        return CGRectMake([[numberArray objectAtIndex:0] floatValue],
                          [[numberArray objectAtIndex:1] floatValue],
                          [[numberArray objectAtIndex:2] floatValue],
                          [[numberArray objectAtIndex:3] floatValue]);
    }
    else {
        NSAssert(1, @"frame错了");
    }
    return CGRectZero;
}

@end
