//
//  DCSettingViewCell.h
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCArrowItem.h"
#import "DCSwitchItem.h"
@class DCSettingItem;

@interface DCSettingViewCell : UITableViewCell

@property (strong, nonatomic) DCSettingItem *item; /**< 导入setting模型 */

//快速创建cell的类方法
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)cellStyle;

@end
