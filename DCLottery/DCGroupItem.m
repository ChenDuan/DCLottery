//
//  DCGroupItem.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCGroupItem.h"

@implementation DCGroupItem

+ (instancetype)groupWithItems:(NSArray *)groupItem {
    DCGroupItem *group = [[self alloc] init];
    group.groupItem = groupItem;
    return group;
}

@end
