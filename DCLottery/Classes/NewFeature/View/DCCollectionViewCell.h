//
//  DCCollectionViewCell.h
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) UIImage *image; /**< 背景图片 */

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSUInteger)count;

@end
