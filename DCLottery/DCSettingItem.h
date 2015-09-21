//
//  DCSettingItem.h
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DCSettingItem : NSObject

@property (strong, nonatomic) NSString *title; /**< 标题 */
@property (strong, nonatomic) NSString *subTitle; /**< 子标题 */
@property (strong, nonatomic) UIImage *image; /**< 图片 */
@property (strong, nonatomic) void (^optionBlock)(NSIndexPath *indexPath); /**< 点击某一行调用的block */


//快速创建一个setting模型
+ (instancetype)settingItemWithImage:(UIImage *)image title:(NSString *)title;


@end
