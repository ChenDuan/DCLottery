//
//  DCSettingViewCell.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCSettingViewCell.h"
#import "DCSettingItem.h"

@interface DCSettingViewCell ()

@property (strong, nonatomic) UISwitch *switchBtn; /**< <#注释#> */
@property (weak, nonatomic) UIImageView *arrowView; /**< <#注释#> */

@end

@implementation DCSettingViewCell

- (UIImageView *)arrowView {
    if (!_arrowView) {
        UIImageView *arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
        _arrowView = arrowView;
        [self.contentView addSubview:arrowView];
    }
    return _arrowView;
                                  
                                  
}

- (UISwitch *)switchBtn {
    if (!_switchBtn) {
        _switchBtn = [[UISwitch alloc] init];
    }
    return _switchBtn;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)cellStyle {
    static NSString *ID = @"cell";
    DCSettingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DCSettingViewCell alloc] initWithStyle:cellStyle reuseIdentifier:ID];
        cell.backgroundColor = [UIColor clearColor];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GroupCell"]];
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GroupCellSelected"]];
        
    }
    return cell;
}

- (void)setItem:(DCSettingItem *)item {
    _item = item;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    self.imageView.image = item.image;
    [self setAccessryView];
}

/**
 *  设置cell的样式
 */
- (void)setAccessryView {
    if ([_item isKindOfClass:[DCSwitchItem class]]) {
        self.accessoryView = self.switchBtn;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if ([_item isKindOfClass:[DCArrowItem class]]) {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = self.arrowView;
    } else {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.accessoryView = nil;
    }
        
}
@end
