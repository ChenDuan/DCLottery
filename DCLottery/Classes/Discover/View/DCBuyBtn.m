//
//  DCBuyBtn.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCBuyBtn.h"
#import "UIView+Frame.h"

@implementation DCBuyBtn

/**
 *  重新布局按钮内部图片,标题的位置
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    //当按钮按默认效果排列时才会重新布局
    if (self.titleLabel.x > self.imageView.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}
//重写文字set方法 文字自适应
- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self sizeToFit];
}

//按钮来自代码便会调用init方法初始化
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //取消按钮的点击效果
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}
//从xib加载会调用此方法
- (void)awakeFromNib {
    [super awakeFromNib];
    self.adjustsImageWhenHighlighted = NO;
}


@end
