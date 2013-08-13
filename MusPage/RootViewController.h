//
//  RootViewController.h
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) UITableView *tableView;

@end
