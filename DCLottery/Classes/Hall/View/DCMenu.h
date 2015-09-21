//
//  DCMenu.h
//  DCLottery
//
//  Created by duanchenvip on 15/9/18.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCMenu;

@protocol DCMenuDelegate <NSObject>

@optional

- (void)menuDidClickClose:(DCMenu *)menu;

@end

@interface DCMenu : UIView

@property (weak, nonatomic) id <DCMenuDelegate>delegate; /**< 图片列表代理 */


+ (instancetype)menu;

+ (instancetype)showAtPoint:(CGPoint)point;

- (void)hideInPoint:(CGPoint)point complition:(void(^)())complition;

@end
