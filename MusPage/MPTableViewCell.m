//
//  MPTableViewCell.m
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//

#import "MPTableViewCell.h"
#import "MPLayout.h"
#import "MPViewItem.h"

@interface MPTableViewCell ()

@property (nonatomic,retain) NSMutableArray *viewsArray;

@end

@implementation MPTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)getViewByIndex:(int)index class:(Class)class{
    if (!self.viewsArray) {
        self.viewsArray = [[NSMutableArray alloc] init];
    }
    
    if (self.viewsArray.count > index){
        id  view = [self.viewsArray objectAtIndex:index];
        if ([view isMemberOfClass:class]){
            return view;
        }
    }
    
    if (self.viewsArray.count == index) {
        UIView *view = [[class alloc] init];
        [self.viewsArray addObject:view];
        return view;
    }
    
    NSAssert(1, @"这是怎么遍历的？？？");
    return NULL;
}

- (void)setRender:(NSDictionary *)render{
    if (_render == render) {
        return;
    }
    _render = render;
    
    MPLayout *layout = [[MPLayout alloc]initWithJson:render];
    NSLog(@"layout %@",layout);
    
    
    for (int i =0 ; i < layout.viewItems.count ; i++) {
        MPViewItem *viewItem = [layout.viewItems objectAtIndex:i];
        Class viewClassObj = NSClassFromString(viewItem.viewClass);
        NSAssert1(viewClassObj, @"没这个class，姐们儿",viewItem.viewClass);
        UIView *view = [self getViewByIndex:i class:viewClassObj];
        [view initialWithJSON:viewItem.viewAttributes];
        [self.contentView addSubview:view];
    }
}

@end
