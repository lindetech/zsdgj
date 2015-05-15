//
//  XXAreaViewController.h
//  XXZSDGJ
//
//  Created by 肖旋 on 15/5/12.
//  Copyright (c) 2015年 xiaoxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XXAreaViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) void(^block)(NSString *);

@property (nonatomic, strong) UILabel * areaLabel;

@property (nonatomic, strong) NSString * currentArea;

@end
