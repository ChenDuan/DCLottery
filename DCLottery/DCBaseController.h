//
//  DCBaseController.h
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCGroupItem.h"
#import "DCSettingItem.h"
#import "DCArrowItem.h"
#import "DCSettingViewCell.h"


@interface DCBaseController : UITableViewController

@property (strong, nonatomic) NSMutableArray *groups; /**< 页面元素数组 */

@end
