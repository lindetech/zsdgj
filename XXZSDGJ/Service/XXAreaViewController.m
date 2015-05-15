//
//  XXAreaViewController.m
//  XXZSDGJ
//
//  Created by 肖旋 on 15/5/12.
//  Copyright (c) 2015年 xiaoxuan. All rights reserved.
//

#import "XXAreaViewController.h"
#import "XXAreaCell.h"

@interface XXAreaViewController ()

@end

@implementation XXAreaViewController
{
    NSMutableArray * _dataSource;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customizeNavigationBar];
    [self createBackground];
    [self createDataSource];
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)customizeNavigationBar
{
    self.navigationController.navigationBarHidden = YES;
    
    UIButton * areaButton = [[UIButton alloc] initWithFrame:CGRectMake(16, 34, 20, 20)];
    [areaButton setImage:[UIImage imageNamed:@"icon_actionbar_nav.png"] forState:UIControlStateNormal];
    [areaButton setImage:[UIImage imageNamed:@"icon_actionbar_nav_press.png"] forState:UIControlStateHighlighted];
    [areaButton addTarget:self action:@selector(areaButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:areaButton];
    
    UIButton * callButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 36, 34, 20, 20)];
    [callButton setImage:[UIImage imageNamed:@"icon_actionbar_cc.png"] forState:UIControlStateNormal];
    [callButton setImage:[UIImage imageNamed:@"icon_actionbar_cc_press.png"] forState:UIControlStateHighlighted];
    [self.view addSubview:callButton];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, self.view.frame.size.width - 200, 47)];
    titleLabel.text = @"掌 上 大 管 家";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:20];
    titleLabel.textColor = TEXT_COLOR;
    [self.view addSubview:titleLabel];
    
    _areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 34, 40, 20)];
    _areaLabel.text = self.currentArea;
    _areaLabel.textColor = TEXT_COLOR;
    _areaLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:16];
    [self.view addSubview:_areaLabel];
    
    
    NSLog(@"%f,%f,%f,%f,", self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height);
}

- (void)areaButtonOnClick:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)createBackground
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.tabBarController.view.subviews[2] setAlpha:0];
    UILabel * label0 = [[UILabel alloc] initWithFrame:CGRectMake(24, 92, 150, 17)];
    label0.text = @"选择服务区域";
    label0.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:17];
    label0.textColor = TEXT_COLOR;
    [self.view addSubview:label0];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(24, 133, 100, 36)];
    label1.text = self.currentArea;
    label1.textColor = TEXT_COLOR;
    label1.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:36];
    [self.view addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 24 - 12, self.view.frame.size.width, 12)];
    label2.text = @"我们正在努力为更多城市提供服务";
    label2.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:12];
    label2.textColor = TEXT_COLOR;
    label2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label2];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 20 - 24, 20 + 48 + 77, 20, 20)];
    imageView.image = [UIImage imageNamed:@"icon_actionbar_nav.png"];
    [self.view addSubview:imageView];
}

- (void)createDataSource
{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    [_dataSource addObjectsFromArray:@[@"北京", @"上海", @"广州", @"深圳", @"杭州", @"成都", @"重庆", @"天津", @"西安", @"武汉"]];
}

- (void)createTableView
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 181, self.view.frame.size.width, self.view.frame.size.height - 181 - 60) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XXAreaCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"XXAreaCell" owner:self options:nil][0];
    }
    cell.areaLabel.text = _dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.block(_dataSource[indexPath.row]);
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
