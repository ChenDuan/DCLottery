//
//  UIImage+DCExtension.m
//  图片拉伸类扩展
//
//  Created by duanchenvip on 15/7/29.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "UIImage+DCExtension.h"

@implementation UIImage (DCExtension)

+ (instancetype)resizableImage:(NSString *)name {
    UIImage *image = [self imageNamed:name];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    return image;
}

@end
