//
//  MPLayout.h
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//


@interface MPLayout : NSObject

@property (nonatomic,retain) NSArray *viewItems;

- (id)initWithJson:(NSDictionary *)json;

@end
