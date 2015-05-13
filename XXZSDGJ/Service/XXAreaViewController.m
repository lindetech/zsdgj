//
//  XXAreaViewController.m
//  XXZSDGJ
//
//  Created by 肖旋 on 15/5/12.
//  Copyright (c) 2015年 xiaoxuan. All rights reserved.
//

#import "XXAreaViewController.h"

@interface XXAreaViewController ()

@end

@implementation XXAreaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self customizeNavigationBar];
    [self createBackground];
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
    
    UILabel * areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 34, 40, 20)];
    areaLabel.text = @"北京";
    areaLabel.textColor = TEXT_COLOR;
    areaLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:16];
    [self.view addSubview:areaLabel];
    
    
    NSLog(@"%f,%f,%f,%f,", self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height);
}

- (void)createBackground
{
    [self.navigationController.tabBarController.view.subviews[2] setAlpha:0];
    UILabel * label0 = [[UILabel alloc] initWithFrame:CGRectMake(24, 92, 150, 17)];
    label0.text = @"选择服务区域";
    label0.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:17];
    label0.textColor = TEXT_COLOR;
    [self.view addSubview:label0];
    
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(24, 133, 100, 36)];
    label1.text = @"北京";
    label1.textColor = TEXT_COLOR;
    label1.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:36];
    [self.view addSubview:label1];
}

- (void)createTableView
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 193, self.view.frame.size.width, self.view.frame.size.height - 193 - 60) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = @"上海";
    }
    cell.textLabel.text = @"上海";
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
