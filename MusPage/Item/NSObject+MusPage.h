//
//  NSObject+MusPage.h
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//



@interface NSObject (MusPage)

- (void)initialWithJSON:(NSDictionary*)jsonData;

- (id)normalizeValue:(id)valueData forKey:(NSString*)key;

@end
