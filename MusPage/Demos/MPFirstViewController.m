//
//  MPFirstViewController.m
//  MusPage
//
//  Created by ChenYang on 13-8-13.
//  Copyright (c) 2013年 tb. All rights reserved.
//

#import "MPFirstViewController.h"
#import "GRMustacheTemplate.h"
#import "MPTableViewCell.h"

@interface MPFirstViewController ()

@property (nonatomic,retain) NSArray *pageCellArray;
@property (nonatomic,retain) NSDictionary *dataDic;
@property (nonatomic,retain) NSString *layoutStr;

@end

@implementation MPFirstViewController
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *layoutPath = [[NSBundle mainBundle] pathForResource:@"layout" ofType:@"json"];
    self.layoutStr = [NSString stringWithContentsOfFile:layoutPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    self.dataDic = [[NSString stringWithContentsOfFile:dataPath encoding:NSUTF8StringEncoding error:nil] objectFromJSONString];
    
//    NSDictionary *data = [[self.dataDic objectForKey:@"items"] objectAtIndex:0];
//    NSString *render = [GRMustacheTemplate renderObject:data
//                                             fromString:self.layoutStr
//                                                  error:NULL];
//    NSLog(@"reder %@",render);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dataDic objectForKey:@"items"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"test";
    MPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[MPTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell setRender:[[GRMustacheTemplate renderObject:[[self.dataDic objectForKey:@"items"] objectAtIndex:indexPath.row]
                                          fromString:self.layoutStr
                                               error:NULL] objectFromJSONString]];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

@end
