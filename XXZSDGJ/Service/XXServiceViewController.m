//
//  XXServiceViewController.m
//  XXZSDGJ
//
//  Created by 肖旋 on 15/5/6.
//  Copyright (c) 2015年 xiaoxuan. All rights reserved.
//

#import "XXServiceViewController.h"
#import "XXAreaViewController.h"

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

#define _HEIGHT /(667 - 20 - 44 - 49)

@interface XXServiceViewController ()

@end

@implementation XXServiceViewController
{
    UIPageControl * _XXPageControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customizeNavigationBar];
    [self creatBackground];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    UILabel * areaLabel = [[UILabel alloc] initWithFrame:CGRectMake(44, 34, 40, 20)];
    areaLabel.text = @"北京";
    areaLabel.textColor = TEXT_COLOR;
    areaLabel.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:16];
    [self.view addSubview:areaLabel];
    
    
    NSLog(@"%f,%f,%f,%f,", self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width,self.view.frame.size.height);
}

- (void)areaButtonOnClick:(id)sender
{
    XXAreaViewController * temp = [[XXAreaViewController alloc] init];
    [self.navigationController pushViewController:temp animated:YES];
}

- (void)creatBackground
{
    UIImageView * backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, HEIGHT -  49 - 272, WIDTH, 272)];
    backImageView.image = [UIImage imageNamed:@"background_tall.png"];
    [self.view addSubview:backImageView];
    
    UIScrollView * scr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 68, WIDTH, HEIGHT - 68 - 49)];
    scr.contentSize = CGSizeMake(WIDTH * 3, HEIGHT - 68 - 49);
    scr.pagingEnabled = YES;
    scr.showsHorizontalScrollIndicator = NO;
    scr.bounces = NO;
    scr.delegate = self;
    NSArray * carName = @[@"金杯车", @"3米厢车", @"4米厢车"];
    NSArray * carSize = @[@"长 25米 宽 20米 高 15米", @"3米厢车", @"4米厢车"];
    for (int i = 0; i < 3; i++) {
        UILabel * label0 = [[UILabel alloc] initWithFrame:CGRectMake(i * WIDTH + 23.5, 196, 200, 39)];
        label0.text = carName[i];
        label0.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:46];
        label0.textColor = TEXT_COLOR;
        [scr addSubview:label0];
        
        UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(i * WIDTH + 23.5, 243, 200, 15)];
        label1.text = carSize[i];
        label1.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:17];
        label1.textColor = TEXT_COLOR_LIGHT;
        [scr addSubview:label1];
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:CGRectMake(i * WIDTH + 135, scr.frame.size.height - 144 - 14 - 24, 90, 14)];
        label2.text = @"基本价格￥";
        label2.textColor = [UIColor whiteColor];
        label2.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:15];
        [scr addSubview:label2];
        
        UILabel * label3 = [[UILabel alloc] initWithFrame:CGRectMake(i * WIDTH + 205, scr.frame.size.height - 144 - 60 - 24, WIDTH - 205 - 23.5, 60)];
        label3.textColor = [UIColor whiteColor];
        label3.text = @"0.00";
        label3.textAlignment = NSTextAlignmentRight;
        label3.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:75];
        [scr addSubview:label3];
        
        UILabel * carIntro = [[UILabel alloc] initWithFrame:CGRectMake(i * WIDTH + 23.5, scr.frame.size.height - 144, WIDTH - 47, 88)];
        carIntro.backgroundColor = [UIColor clearColor];
        NSString * labelText = @"我们都有一个家名字叫中国兄弟姐妹都很多景色也不错家里盘着两条龙是长江与黄河呀还有珠穆朗玛峰儿是最高山坡我们都有一个家名字叫中国我们都有一个家名字叫中国";
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:7];//调整行间距
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
        carIntro.attributedText = attributedString;
        carIntro.font = label1.font = [UIFont fontWithName:@"SourceHanSansCN-Regular" size:15];
        carIntro.textColor = [UIColor whiteColor];
        carIntro.numberOfLines = 0;
        [scr addSubview:carIntro];
        
        UIImageView * carImage = [[UIImageView alloc] initWithFrame:CGRectMake(i * WIDTH + 23.5, 28 * 28 _HEIGHT, WIDTH - 47, HEIGHT * 144 _HEIGHT)];
        carImage.image = [UIImage imageNamed:@"货车朝右1.png"];
        [scr addSubview:carImage];
        
    }
    [self.view addSubview:scr];
    
    
    
    _XXPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, HEIGHT - 56 - 49, WIDTH, 56)];
    _XXPageControl.backgroundColor = MAIN_COLOR;
    _XXPageControl.userInteractionEnabled = NO;
    _XXPageControl.numberOfPages = 3;
    _XXPageControl.currentPage = 0;
    [self.view addSubview:_XXPageControl];
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x < WIDTH / 2) {
        _XXPageControl.currentPage = 0;
    } else if (scrollView.contentOffset.x < 3 * WIDTH / 2 && scrollView.contentOffset.x >= WIDTH / 2) {
        _XXPageControl.currentPage = 1;
    } else if (scrollView.contentOffset.x < 5 * WIDTH / 2 && scrollView.contentOffset.x >= 3 * WIDTH / 2) {
        _XXPageControl.currentPage = 2;
    }
    
}

@end
