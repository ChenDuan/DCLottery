//
//  DCArenaNavViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCArenaNavViewController.h"
#import "UIImage+DCExtension.h"

@interface DCArenaNavViewController ()

@end

@implementation DCArenaNavViewController

/**
 *  此页面有自己的导航条 所以要自定义一个
 */
+ (void)initialize {
    if (self == [DCArenaNavViewController class]) {
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        UIImage *image = [UIImage resizableImage:@"NLArenaNavBar64"];
        [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
