//
//  XXOrderListViewController.m
//  XXZSDGJ
//
//  Created by 肖旋 on 15/5/15.
//  Copyright (c) 2015年 xiaoxuan. All rights reserved.
//

#import "XXOrderListViewController.h"
#import "XXOrderCell.h"

@interface XXOrderListViewController ()

@end

@implementation XXOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customizeNavigationBar];
    [self createTableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customizeNavigationBar
{
    self.navigationController.navigationBarHidden = YES;
    
    UIButton * callButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 36, 34, 20, 20)];
    [callButton setImage:[UIImage imageNamed:@"icon_actionbar_cc.png"] forState:UIControlStateNormal];
    [callButton setImage:[UIImage imageNamed:@"icon_actionbar_cc_press.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:callButton];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, self.view.frame.size.width - 200, 47)];
    titleLabel.text = @"订 单";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:20];
    titleLabel.textColor = TEXT_COLOR;
    [self.view addSubview:titleLabel];
}

- (void)createDataSource
{
    
}

- (void)createTableView
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 68, self.view.frame.size.height, self.view.frame.size.height - 49) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XXOrderCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"XXOrderCell" owner:self options:nil][0];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 124;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
