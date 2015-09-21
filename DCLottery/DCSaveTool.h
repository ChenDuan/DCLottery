//
//  DCSaveTool.h
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCSaveTool : NSObject

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setObject:(id)value forKey:(NSString *)defaultName;

@end
