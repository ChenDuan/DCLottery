//
//  DCCollectionViewCell.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCCollectionViewCell.h"
#import "DCTabBarController.h"
#import "UIView+Frame.h"

@interface DCCollectionViewCell ()

@property (weak, nonatomic) UIImageView *imageView; /**< 背景view */
@property (weak, nonatomic) UIButton *startBtn; /**< 开始按钮 */


@end

@implementation DCCollectionViewCell

//懒加载 添加背景view
- (UIImageView *)imageView {
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _imageView = imageView;
        [self.contentView addSubview:imageView];
    }
    return _imageView;
}
//添加按钮
- (UIButton *)startBtn {
    if (!_startBtn) {
        UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [startBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [startBtn sizeToFit];
        _startBtn = startBtn;
        [startBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:startBtn];
    }
    return _startBtn;
}

//设置背景图片
- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

//布局背景view
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    //布局按钮
    self.startBtn.center = CGPointMake(self.width * 0.5, self.height * 0.95);
    
}

- (void)btnClick {
    DCTabBarController *vc = [[DCTabBarController alloc] init];
    //设置点击按钮后跳转到DCTabBarController
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    //跳转动画
    CATransition *anima = [CATransition animation];
    anima.type = @"rippleEffect";
    anima.duration = 2.0;
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:anima forKey:nil];
}

/**
 *  设置按钮的显示状态
 *
 *  @param indexPath 哪一个界面
 *  @param count     一共有多少界面
 */
- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSUInteger)count {
    //跳转到最后一个页面显示按钮
    if (indexPath.row == count - 1) {
        self.startBtn.hidden = NO;
    } else {
        //其他页面隐藏
        self.startBtn.hidden = YES;
    }
}

@end
