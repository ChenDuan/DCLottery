//
//  DCArenaViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCArenaViewController.h"
#import "DCBackView.h"

@interface DCArenaViewController ()

@end

@implementation DCArenaViewController

/**
 *  加载背景view
 */
- (void)loadView {
    //创建背景view
    DCBackView *view = [[DCBackView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //赋值
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置选择标签栏,包含2个item
    UISegmentedControl *segCon = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    //设置背景图片
    [segCon setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segCon setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    segCon.tintColor = [UIColor colorWithRed:0 green:142/255.0 blue:143/255.0 alpha:1];
    [segCon setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName : [UIColor whiteColor]
                                     }forState:UIControlStateSelected];
    self.navigationItem.titleView = segCon;
    segCon.selectedSegmentIndex = 0;
}



@end
