//
//  DCSettingViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCSettingViewController.h"
#import "DCPushViewController.h"

@interface DCSettingViewController ()

@end

@implementation DCSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setGroup0];
    [self setGroup1];
    // Do any additional setup after loading the view.
}
//设置每一组
- (void)setGroup0 {
    DCSettingItem *item = [DCSettingItem settingItemWithImage:[UIImage imageNamed:@"MorePush"] title:@"使用兑换码"];
    DCSettingItem *item1 = [DCSettingItem settingItemWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"使用兑换码"];
    DCGroupItem *group = [DCGroupItem groupWithItems:@[item,item1]];
    item.optionBlock = ^(NSIndexPath *indexPath) {
        NSLog(@"使用兑换码");
    };
    [self.groups addObject:group];
}

- (void)setGroup1 {
    DCArrowItem *arrow = [DCArrowItem settingItemWithImage:[UIImage imageNamed:@"MoreShare"] title:@"比赛信息"];
    arrow.desVcClass = [DCPushViewController class];
    DCSwitchItem *switchBtn = [DCSwitchItem settingItemWithImage:[UIImage imageNamed:@"MoreMessage"] title:@"关注"];
    DCGroupItem *group = [DCGroupItem groupWithItems:@[arrow,switchBtn]];
    [self.groups addObject:group];
}



@end
