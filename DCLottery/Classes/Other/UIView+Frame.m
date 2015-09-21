//
//  UIView+Frame.m
//  小码哥彩票
//
//  Created by xiaomage on 15/8/25.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY
{
    return self.center.y;
}
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}


- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}


- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;

}
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;

}
- (CGFloat)width
{
    return  self.bounds.size.width;
}

- (CGFloat)height
{
   return  self.bounds.size.height;
}

@end
