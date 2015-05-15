//
//  XXOrderCell.m
//  XXZSDGJ
//
//  Created by 肖旋 on 15/5/15.
//  Copyright (c) 2015年 xiaoxuan. All rights reserved.
//

#import "XXOrderCell.h"

@implementation XXOrderCell

- (void)awakeFromNib {
    self.aview.layer.cornerRadius = 25;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.backgroundColor = [UIColor blackColor];
    // Configure the view for the selected state
}

@end
