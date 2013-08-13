//
//  MPFirstViewController.m
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//

#import "MPFirstViewController.h"
#import "GRMustacheTemplate.h"

@interface MPFirstViewController ()

@end

@implementation MPFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *render = [GRMustacheTemplate renderObject:[NSDictionary dictionary]
                                             fromString:@"asdf"
                                                  error:NULL];
    NSLog(@"reder %@",render);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
