//
//  MPLayout.m
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//

#import "MPLayout.h"
#import "MPViewItem.h"

@implementation MPLayout


- (id)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        [self setFromDictionary:json];
    }
    return self;
}

- (void)setFromDictionary:(NSDictionary *)dic {
    NSArray *keys = [dic allKeys];
    for (NSString *key in keys){
        
        id value = [dic objectForKey:key];
        
        if ([key isEqualToString:@"viewItems"] && [value isKindOfClass:[NSArray class]]) {
            NSMutableArray *itemsArray = [NSMutableArray array];
            
            for (NSDictionary *itemDic in (NSArray *)value){
                MPViewItem *item = [[MPViewItem alloc] initWithJson:itemDic];
                [itemsArray addObject:item];
            }
            
            [self setValue:itemsArray forKey:key];
        }
        else {
            [self setValue:value forKey:key];
        }
    }
}

@end
