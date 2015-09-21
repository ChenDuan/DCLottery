//
//  UIView+Frame.h
//  小码哥彩票
//
//  Created by xiaomage on 15/8/25.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

// 分类中是不能声明属性


// @property在类中功能:会自动生成get,set方法的声明和实现,和_成员属性.

// @property在分类功能:只会生成get,set方法的声明
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

//- (CGFloat)width;
//
//- (void)setWidth:(CGFloat)width;
//
//- (CGFloat)height;



@end
