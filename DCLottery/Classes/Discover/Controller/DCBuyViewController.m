//
//  DCBuyViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCBuyViewController.h"
#import "DCBuyBtn.h"

@interface DCBuyViewController ()

@end

@implementation DCBuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建标题按钮
    UIButton *btn = [DCBuyBtn buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [btn setTitle:@"全部彩种" forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(btnRotate:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = btn;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"助手" style:UIBarButtonItemStyleDone target:self action:@selector(btnClick)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
}

- (void)btnRotate:(UIButton *)btn {
    [UIView animateWithDuration:0.5 animations:^{
        btn.imageView.transform = CGAffineTransformMakeRotation(-M_PI);
    }];
}

- (void)btnClick {
    
}


@end
