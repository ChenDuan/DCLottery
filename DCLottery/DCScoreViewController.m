//
//  DCScoreViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCScoreViewController.h"

@interface DCScoreViewController ()

@end

@implementation DCScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setGroup];
    self.title = @"开奖信息";
    // Do any additional setup after loading the view.
}

- (void)setGroup {
    DCSettingItem *item = [DCSettingItem settingItemWithImage:nil title:@"开始时间"];
    item.subTitle = @"00:00";
    DCSettingItem *item1 = [DCSettingItem settingItemWithImage:nil title:@"开始时间"];
    item1.subTitle = @"00:00";
    DCGroupItem *group = [DCGroupItem groupWithItems:@[item,item1]];
    group.footer = @"开启后，当我投注或关注的比赛开始、进球和结束时，会自动发送推送消息提醒我";
    [self.groups addObject:group];

}



@end
