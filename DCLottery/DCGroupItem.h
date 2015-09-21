//
//  DCGroupItem.h
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCGroupItem : NSObject

@property (strong, nonatomic) NSArray *groupItem; /**< 模型数组 */
@property (strong, nonatomic) NSString *header; /**< 头标题 */
@property (strong, nonatomic) NSString *footer; /**< 尾标题 */

//类工厂方法快速创建一个group模型
+ (instancetype)groupWithItems:(NSArray *)groupItem;

@end
