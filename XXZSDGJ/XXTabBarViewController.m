//
//  XXTabBarViewController.m
//  XXZSDGJ
//
//  Created by 肖旋 on 15/5/7.
//  Copyright (c) 2015年 xiaoxuan. All rights reserved.
//

#import "XXTabBarViewController.h"

@interface XXTabBarViewController ()

@end

@implementation XXTabBarViewController
{
    NSMutableArray * _LabelsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self custemizeTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)custemizeTabBar
{
    self.tabBar.hidden = YES;
    UIView * tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 49, self.view.frame.size.width, 49)];
    
    NSArray * titles = @[@"服 务", @"订 单", @"我 的"];
    NSArray * imageNames = @[@"icon_btm_service_press.png", @"icon_btm_order_press.png", @"icon_btm_mine_press.png"];
    NSArray * selectedImageNames = @[@"icon_btm_service.png", @"icon_btm_order.png", @"icon_btm_mine.png"];
    _LabelsArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 3; i++) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 6 * (i * 2 + 1)  - 12, 7, 24, 24)];
        
        [button setImage:[UIImage imageNamed:imageNames[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:selectedImageNames[i]] forState:UIControlStateSelected];
        
        button.adjustsImageWhenHighlighted = NO;
        
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = 10 + i;
        
        [tabBarView addSubview:button];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 6 * (i * 2 + 1)  - 13, 28, 26, 20)];
        label.text = titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:11];
        label.textColor = TEXT_COLOR_LIGHT;
        label.tag = 20 + i;
        
        //设置首选按钮 选中状态
        if (i == 0) {
            button.selected = YES;
            button.userInteractionEnabled = NO;
            label.textColor = TEXT_COLOR;
        }
        
        
        [_LabelsArray addObject:label];
        [tabBarView addSubview:label];
    }
    
    tabBarView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:tabBarView];
}

- (void)onClick:(UIButton *)button
{
    //被点中，进入选中状态
    button.selected = YES;
    //不能接收事件
    button.userInteractionEnabled = NO;
    
    //切换页面 使用继承自父类的方法
    self.selectedIndex = button.tag - 10;
    
    //点击了一个页面，别的页面button全灭
    for (NSInteger i = 0; i < 3; i++) {
        UIButton * bt = (id)[self.view viewWithTag:10 + i];
        UILabel * label = (id)[self.view viewWithTag:20 + i];
        //viewWithTag这个方法是深度遍历，也就是说，不仅能找到self.view的子视图，也能找到子视图的子视图
        if (i == button.tag - 10) {
            label.textColor = TEXT_COLOR;
            continue;
        }
        bt.selected = NO;
        bt.userInteractionEnabled = YES;
        label.textColor = TEXT_COLOR_LIGHT;
        
    }
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
