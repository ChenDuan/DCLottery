//
//  DCSettingItem.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCSettingItem.h"

@implementation DCSettingItem

+ (instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title {
    DCSettingItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    return item;
}

@end
