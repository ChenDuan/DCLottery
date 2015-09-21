//
//  DCCover.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCCover.h"

#define DCKeyWindow [UIApplication sharedApplication].keyWindow


@implementation DCCover

/**
 *  黑色背景遮罩图层
 */
+ (void)show {
    //设置遮罩的大小等于背景的大小
    DCCover *cover = [[DCCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.alpha = 0.5;
    cover.backgroundColor = [UIColor blackColor];
    //将遮罩添加到当前窗口
    [DCKeyWindow addSubview:cover];
}
/**
 *  隐藏遮罩图层
 */
+ (void)hide {
    //遍历窗口中的所有view
    for (UIView *cover in DCKeyWindow.subviews) {
        //判断是自身的话便从父类删除
        if ([cover isKindOfClass:self]) {
            [cover removeFromSuperview];
        }
    }
}

@end
