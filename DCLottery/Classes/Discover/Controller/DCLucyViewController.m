//
//  DCLucyViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCLucyViewController.h"


@interface DCLucyViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *light;

@end

@implementation DCLucyViewController
//添加背景图
//- (void)loadView {
//    DCLucyView *lucyView = [[DCLucyView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.view = lucyView;
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加动画效果
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image = [UIImage imageNamed:@"lucky_entry_light1"];
    _light.animationImages = @[image1,image];
    _light.animationDuration = 0.5;
    [_light startAnimating];
    self.navigationItem.title = @"幸运选号";
    
    // Do any additional setup after loading the view.
}



@end
