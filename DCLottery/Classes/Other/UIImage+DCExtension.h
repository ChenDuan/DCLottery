//
//  UIImage+DCExtension.h
//  图片拉伸类扩展
//
//  Created by duanchenvip on 15/7/29.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DCExtension)
/**
 *  拉伸图片的方法
 *
 *  @param name 接收一张新图片
 *
 *  @return 返回拉伸好的图片
 */
+ (instancetype)resizableImage:(NSString *)name;

@end
