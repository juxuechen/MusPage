//
//  MPViewItem.m
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//

#import "MPViewItem.h"

@implementation MPViewItem

- (id)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        [self setFromDictionary:json];
    }
    return self;
}

- (void)setFromDictionary:(NSDictionary *)dic {
    self.viewClass = [dic objectForKey:@"viewClass"];
    
    self.viewAttributes = [NSDictionary dictionaryWithDictionary:dic];
}

@end
