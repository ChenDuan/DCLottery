//
//  DCTabBar.h
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCTabBar;

@protocol DCTabBarDelegate<NSObject>

@optional

- (void)tabBar:(DCTabBar *)tabbar didClickBtn:(NSInteger)index;

@end

@interface DCTabBar : UIView

@property (strong, nonatomic) NSArray *items; /**< tabbar数组 */
@property (weak, nonatomic) id<DCTabBarDelegate> delegate ;/**< 代理 */


@end
