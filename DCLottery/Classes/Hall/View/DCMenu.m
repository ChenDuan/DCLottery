//
//  DCMenu.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCMenu.h"
#define DCKeyWindow [UIApplication sharedApplication].keyWindow

@interface DCMenu ()


@end

@implementation DCMenu

/**
 *  加载nib文件
 *
 *  @return 返回menu
 */
+ (instancetype)menu {
    return [[[NSBundle mainBundle] loadNibNamed:@"DCMenu" owner:self options:nil] lastObject];
}


- (IBAction)btnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(menuDidClickClose:)]) {
        [self.delegate menuDidClickClose:self];
    }
}

/**
 *  设置图片显示的地点
 *
 *  @param point 位置
 *
 *  @return 返回自身
 */
+ (instancetype)showAtPoint:(CGPoint)point {
    DCMenu *menu = [DCMenu menu];
    menu.center = point;
    [DCKeyWindow addSubview:menu];
    return menu;
}

/**
 *  关闭图片
 *
 *  @param point      图片隐藏的位置
 *  @param complition 完成后调用隐藏遮罩的block
 */
- (void)hideInPoint:(CGPoint)point complition:(void (^)())complition {
    [UIView animateWithDuration:1.0 animations:^{
        self.center = point;
        self.transform = CGAffineTransformMakeScale(- 0.01, - 0.01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (complition) {
            complition();
        }
    }];
    
}

@end
