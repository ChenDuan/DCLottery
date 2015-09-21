//
//  DCTabBarController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCTabBarController.h"
#import "DCHallViewController.h"
#import "DCArenaViewController.h"
#import "DCDiscoverViewController.h"
#import "DCHistoryViewController.h"
#import "DCMyViewController.h"
#import "DCNavigationViewController.h"
#import "DCTabBar.h"
#import "DCArenaNavViewController.h"


@interface DCTabBarController () <DCTabBarDelegate>

@property (strong, nonatomic) NSMutableArray *items; /**< 自定义的items数组 */

@end

@implementation DCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildViewController];
    [self setTabBar];
    
}

- (void)setTabBar {
    //自定义tabbar覆盖系统的
    DCTabBar *tabBar = [[DCTabBar alloc] initWithFrame:self.tabBar.bounds];
    //为自定义tabbar中的item数组赋值
    tabBar.items = self.items;
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

/**
 *  在界面将要显示的时候将系统tabbar中的item删除
 *
 *  @param animated animated description
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for (UIView *item in self.tabBar.subviews) {
        if ([item isKindOfClass:[DCTabBar class]] == NO) {
            [item removeFromSuperview];
        }
    }
}
/**
 *  加载所有的子控制器
 */
- (void)setUpAllChildViewController {
    
    //购彩大厅
    DCHallViewController *hall = [[DCHallViewController alloc] init];
    [self setUpOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    //竞技场
    DCArenaViewController *arena = [[DCArenaViewController alloc] init];
    [self setUpOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:@"竞技场"];
    
    //发现
   // DCDiscoverViewController *discover = [[DCDiscoverViewController alloc] init];
    //让自定义的Storyboard 成为加载的自控制器
    UIStoryboard *stor = [UIStoryboard storyboardWithName:@"DCDiscoverViewController" bundle:nil];
    DCDiscoverViewController *discover = [stor instantiateInitialViewController];
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    //开奖信息
    DCHistoryViewController *history = [[DCHistoryViewController alloc] init];
    [self setUpOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    //我的彩票
    DCMyViewController *my = [[DCMyViewController alloc] init];
    [self setUpOneChildViewController:my image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
    
    
}

/**
 *  设置每一个控制器的属性
 *
 *  @param ChildViewController 添加的子控制器
 *  @param image               对应的tabbarItem图片
 *  @param selImage            选中的tabbarItem图片
 *  @param title               tabbarItem标题
 */
- (void)setUpOneChildViewController:(UIViewController *)ChildViewController image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title {
    ChildViewController.tabBarItem.image = image;
    ChildViewController.tabBarItem.selectedImage = selImage;
    ChildViewController.title = title;
    //添加每一个item到数组
    [self.items addObject:ChildViewController.tabBarItem];
    //设置导航控制器的根控制器
    UINavigationController *nav = [[DCNavigationViewController alloc] initWithRootViewController:ChildViewController];
    /**
     *  判断如果是竞技场页面选择自己的导航控制器
     */
    if ([ChildViewController isKindOfClass:[DCArenaViewController class]]) {
        nav = [[DCArenaNavViewController alloc] initWithRootViewController:ChildViewController];
    }
    //添加每一个子控制器
    [self addChildViewController:nav];
}

#pragma mark - DCTabBarDelegate

- (void)tabBar:(DCTabBar *)tabbar didClickBtn:(NSInteger)index {
    
    self.selectedIndex = index;
}



@end
