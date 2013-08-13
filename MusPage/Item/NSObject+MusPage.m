//
//  NSObject+MusPage.m
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//

#import "NSObject+MusPage.h"
#import "MPUtil.h"

@implementation NSObject (MusPage)

- (void)initialWithJSON:(NSDictionary*)jsonData {
    for (NSString* key in jsonData) {
        
        id originalValue = [jsonData objectForKey:key];

        if (originalValue == [NSNull null]) {
            continue;
        }
       
        id value = [self normalizeValue:originalValue forKey:key];
   
        @try {
            [self setValue:value forKey:key];
        } @catch (NSException* exception) {
            NSLog(@"Exception:Set value for key[%@] with exception[%@]!", key, [exception reason]);
        }
    }
}

- (id)normalizeValue:(id)valueData forKey:(NSString*)key {
    if ([key isEqualToString:@"frame"]) {
        return [NSValue valueWithCGRect:[MPUtil frameFromString:valueData]];
    } 
    return valueData;
}

- (void)setValue:(id)value forUndefinedKey:(NSString*)key {
    NSLog(@"WARNING:Can not find field in class[%@] for key[%@]!", NSStringFromClass([self class]), key);
}


@end
