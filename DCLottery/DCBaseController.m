//
//  DCBaseController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCBaseController.h"

@interface DCBaseController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DCBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
//设置分组模式
- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}
//懒加载模型数组
- (NSMutableArray *)groups {
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

#pragma mark - UITableViewDataSource
//一共有多少行
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}
//每一行cell包含多少列
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DCGroupItem *item = self.groups[section];
    return item.groupItem.count;
}
//配置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DCSettingViewCell *cell = [DCSettingViewCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    DCGroupItem *group = self.groups[indexPath.section];
    cell.item = group.groupItem[indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    DCGroupItem *item = self.groups[section];
    return item.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    DCGroupItem *item = self.groups[section];
    return item.header;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DCGroupItem *group = self.groups[indexPath.section];
    DCSettingItem *item = group.groupItem[indexPath.row];
    if (item.optionBlock) {
        item.optionBlock(indexPath);
        return;
    }
    //如果是arrow类型判断是否能跳转
    if ([item isKindOfClass:[DCArrowItem class]]) {
        DCArrowItem *arrow = (DCArrowItem *)item;
        if (arrow.desVcClass == nil) {
            return;
        }
        UIViewController *vc = [[arrow.desVcClass alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}




@end
