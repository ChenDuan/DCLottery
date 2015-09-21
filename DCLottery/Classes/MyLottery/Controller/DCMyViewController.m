//
//  DCMyViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCMyViewController.h"
#import "UIImage+DCExtension.h"
#import "UIImage+Image.h"
#import "DCSettingViewController.h"

@interface DCMyViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation DCMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置按钮的背景图片为为拉伸好的图片
    UIImage *image = [UIImage resizableImage:@"RedButton"];
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    [btn sizeToFit];
    //设置导航栏左标题为按钮(包含文字和图片)
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"Mylottery_config"] style:UIBarButtonItemStyleDone target:self action:@selector(btnClick)];
    
}

- (void)btnClick {
    DCSettingViewController *vc = [[DCSettingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
