//
//  DCSaveTool.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCSaveTool.h"

@implementation DCSaveTool

+ (void)setObject:(id)value forKey:(NSString *)defaultName {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}

+ (id)objectForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

@end
