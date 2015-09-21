//
//  DCHallViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCHallViewController.h"
#import "UIImage+Image.h"
#import "DCCover.h"
#import "DCMenu.h"

@interface DCHallViewController () <DCMenuDelegate>

@end

@implementation DCHallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回一张没有经过渲染的图片
    UIImage *image = [UIImage imageWithOriginalImageName:@"CS50_activity_image"];
    //设置导航左标签图片
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(activity)];
}

- (void)activity {
    //显示遮罩
    [DCCover show];
    CGFloat X = [UIScreen mainScreen].bounds.size.width * 0.5;
    CGFloat Y = [UIScreen mainScreen].bounds.size.height * 0.5;
    //设置返回值的原因是为了能够设置meun代理
    DCMenu *menu = [DCMenu showAtPoint:CGPointMake(X, Y)];
    menu.delegate = self;
}

#pragma mark - DCMenuDelegate

- (void)menuDidClickClose:(DCMenu *)menu {
    [menu hideInPoint:CGPointMake(44, 44) complition:^{
        [DCCover hide];
    }];
}
@end
