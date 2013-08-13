//
//  MPViewItem.h
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//


@interface MPViewItem : NSObject

@property (nonatomic,retain) NSString *viewClass;
@property (nonatomic,retain) NSDictionary *viewAttributes;

- (id)initWithJson:(NSDictionary *)json;

@end
