//
//  DCGuideTool.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCGuideTool.h"
#import "DCSaveTool.h"
#import "DCTabBarController.h"
#import "DCNewFeatureViewController.h"

@implementation DCGuideTool

+ (UIViewController *)chooseViewController {
    UIViewController *rootVc = nil;
    //当前版本号
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    //最新的版本号
    NSString *lastVersion = [DCSaveTool objectForKey:@"DCVersionKey"];
    if ([curVersion isEqualToString:lastVersion]) {
        rootVc = [[DCTabBarController alloc] init];
    } else {
        [DCSaveTool setObject:curVersion forKey:@"DCVersionKey"];
        rootVc = [[DCNewFeatureViewController alloc] init];
    }
    return rootVc;
}

@end
