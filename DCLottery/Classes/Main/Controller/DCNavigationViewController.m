//
//  DCNavigationViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCNavigationViewController.h"

@interface DCNavigationViewController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation DCNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //为各个控制器添加拖动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
}

/**
 *  初始化导航栏
 */
+ (void)initialize {
    //只对自定义的导航栏产生效果
    if (self == [DCNavigationViewController class]) {
        //当出现导航栏时便会调用此方法进行设置
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        //设置背景图片
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        //title的颜色以及大小
        navBar.titleTextAttributes = @{
                                       NSForegroundColorAttributeName : [UIColor whiteColor],
                                       NSFontAttributeName : [UIFont systemFontOfSize:17]
                                       };
        
    }
}
/**
 *  拦截系统的push方法,增加自己的设置
 *
 *  @param viewController viewController description
 *  @param animated       animated description
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //判断控制器不为当前第一个控制器
    if (self.childViewControllers.count != 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        //隐藏底部BottomBar
            viewController.hidesBottomBarWhenPushed = YES;
    } else {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

#pragma mark - UINavigationControllerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    //防止拖动假死 禁止非push控制器的拖拽效果
    return self.childViewControllers.count != 1;
}


@end
