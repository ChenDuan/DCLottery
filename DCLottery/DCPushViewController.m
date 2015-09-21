//
//  DCPushViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCPushViewController.h"
#import "DCScoreViewController.h"
#import "DCAwardViewController.h"

@interface DCPushViewController ()

@end

@implementation DCPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setGroup0];
    [self setGroup1];
    // Do any additional setup after loading the view.
}

- (void)setGroup0 {
    DCSettingItem *item = [DCSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreNetease"] title:@"发现更多"];
    DCGroupItem *group = [DCGroupItem groupWithItems:@[item]];
    [self.groups addObject:group];
}

- (void)setGroup1 {
    DCArrowItem *arrow = [DCArrowItem settingItemWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"开奖信息"];
    DCArrowItem *arraw1 = [DCArrowItem settingItemWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"比分查询"];
    arrow.desVcClass = [DCAwardViewController class];
    arraw1.desVcClass = [DCScoreViewController class];
    DCGroupItem *group = [DCGroupItem groupWithItems:@[arrow,arraw1]];
    [self.groups addObject:group];
}

@end
