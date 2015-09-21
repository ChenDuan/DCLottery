//
//  DCBackView.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCBackView.h"

@implementation DCBackView
/**
 *  将背景图片绘到背景上 实现加载即可显示
 *
 *  @param rect rect description
 */
- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"NLArenaBackground"];
    [image drawInRect:rect];
}

@end
