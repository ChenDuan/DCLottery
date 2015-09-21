//
//  DCAwardViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCAwardViewController.h"

@interface DCAwardViewController ()

@end

@implementation DCAwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setGroup];
    [self setGroup1];
    [self setgroup3];
    // Do any additional setup after loading the view.
}


//重写cell的数据源方法 改变cell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DCSettingViewCell *cell = [DCSettingViewCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    DCGroupItem *group = self.groups[indexPath.section];
    cell.item = group.groupItem[indexPath.row];
    return cell;
}

- (void)setGroup {
    DCSwitchItem *switch1 = [DCSwitchItem settingItemWithImage:nil title:@"双色球"];
    switch1.subTitle = @"每周二、四、日开奖";
    DCSwitchItem *switch2 = [DCSwitchItem settingItemWithImage:nil title:@"双色球"];
    switch2.subTitle = @"每周二、四、日开奖";
    DCSwitchItem *switch3 = [DCSwitchItem settingItemWithImage:nil title:@"双色球"];
    switch3.subTitle = @"每周二、四、日开奖";
    DCGroupItem *group = [DCGroupItem groupWithItems:@[switch1,switch2,switch3]];
    [self.groups addObject:group];
}

- (void)setGroup1 {
    DCSwitchItem *switch1 = [DCSwitchItem settingItemWithImage:nil title:@"双色球"];
    switch1.subTitle = @"每周二、四、日开奖";
    DCSwitchItem *switch2 = [DCSwitchItem settingItemWithImage:nil title:@"双色球"];
    switch2.subTitle = @"每周二、四、日开奖";
    DCSwitchItem *switch3 = [DCSwitchItem settingItemWithImage:nil title:@"双色球"];
    switch3.subTitle = @"每周二、四、日开奖";
    DCGroupItem *group = [DCGroupItem groupWithItems:@[switch1,switch2,switch3]];
    [self.groups addObject:group];
}

- (void)setgroup3 {
    DCArrowItem *arrow = [DCArrowItem settingItemWithImage:nil title:@"领奖时间"];
    arrow.subTitle = @"00:00";
    DCArrowItem *arrow1 = [DCArrowItem settingItemWithImage:nil title:@"领奖时间"];
    arrow1.subTitle = @"00:00";
    DCArrowItem *arrow2 = [DCArrowItem settingItemWithImage:nil title:@"领奖时间"];
    arrow2.subTitle = @"00:00";
    //block内禁用self
    __weak typeof(self) weakSelf = self;
    //cell内加入UITextField可以实现键盘的自动效果
    arrow.optionBlock = ^(NSIndexPath *indexPath) {
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        UITextField *tf = [[UITextField alloc] init];
        [tf becomeFirstResponder];
        [cell addSubview:tf];
    };
    DCGroupItem *group = [DCGroupItem groupWithItems:@[arrow1,arrow2,arrow]];
    [self.groups addObject:group];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

@end
