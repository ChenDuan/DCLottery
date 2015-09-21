//
//  DCTabBar.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCTabBar.h"
#import "DCTabBarBtn.h"
#import "UIView+Frame.h"

@interface DCTabBar ()

@property (weak, nonatomic) UIButton *selBtn; /**< 选中的btn */

@end

@implementation DCTabBar

/**
 *  在set方法中初始化itemBtn
 *
 *  @param items items数组
 */
- (void)setItems:(NSArray *)items {
    _items = items;
    //遍历数组中的每一个tabbaritem,设置图片
    for (NSInteger i = 0; i < items.count; i++) {
        UITabBarItem *item = _items[i];
        DCTabBarBtn *itemBtn = [DCTabBarBtn buttonWithType:UIButtonTypeCustom];
        [itemBtn setBackgroundImage:item.image forState:UIControlStateNormal];
        [itemBtn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        //按钮点击事件,不需要点击效果 选择TouchDown
        [itemBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:itemBtn];
        //为每一个按钮绑定tag
        itemBtn.tag = i;
        //默认选中第一个按钮
        if (i == 0) {
            [self btnClick:itemBtn];
        }
    }
}

/**
 *  按钮点击的逻辑处理
 *
 *  @param btn 新点击的按钮
 */
- (void)btnClick:(UIButton *)btn {
    self.selBtn.selected = NO;
    btn.selected = YES;
    self.selBtn = btn;
    //将按钮的tag通过代理导出
    if ([self.delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [self.delegate tabBar:self didClickBtn:btn.tag];
    }
}

/**
 *  为按钮布局
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat itemBtnX = 0;
    CGFloat itemBtnY = 0;
    CGFloat itemBtnW = self.width / _items.count;
    CGFloat itemBtnH = self.height;
    for (NSInteger i = 0; i < _items.count; i++) {
        DCTabBarBtn *btn = self.subviews[i];
        itemBtnX = itemBtnW * i;
        btn.frame = CGRectMake(itemBtnX, itemBtnY, itemBtnW, itemBtnH);
    }
    
}

@end
