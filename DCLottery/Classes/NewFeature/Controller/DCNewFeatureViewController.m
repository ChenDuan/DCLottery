//
//  DCNewFeatureViewController.m
//  DCLottery
//
//  Created by duanchenvip on 15/9/19.
//  Copyright (c) 2015年 duanchenvip. All rights reserved.
//

#import "DCNewFeatureViewController.h"
#import "DCCollectionViewCell.h"
#import "UIView+Frame.h"

@interface DCNewFeatureViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>


@property (weak, nonatomic) UIImageView *guide;
@property (weak, nonatomic) UIImageView *largerText;
@property (weak, nonatomic) UIImageView *smallText;

/** 记录上一次移动 */
@property (assign, nonatomic) CGFloat lastOffsetX;

@end

@implementation DCNewFeatureViewController

static NSString *ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册cell
    [self.collectionView registerClass:[DCCollectionViewCell class] forCellWithReuseIdentifier:ID];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    _lastOffsetX = 0;
    [self setChildView];
}

/**
 *  构造CollectionView的布局形式
 *
 *  @return 返回流水布局
 */
- (instancetype)init {
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    //外间距0
    flow.minimumLineSpacing = 0;
    //内间距0
    flow.minimumInteritemSpacing = 0;
    //每一个item的大小填充整个页面
    flow.itemSize = [UIScreen mainScreen].bounds.size;
    //水平滚动
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [self initWithCollectionViewLayout:flow];
}

- (void)setChildView {
    //guide
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    self.guide = guide;
    //设置图片的中心位置为背景的中心
    guide.centerX = self.view.centerX;
    [self.collectionView addSubview:guide];
    //largeText
    UIImageView *largeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    self.largerText = largeText;
    largeText.centerX = self.view.centerX;
    largeText.centerY = self.view.bounds.size.height * 0.8;
    [self.collectionView addSubview:largeText];
    //smallText
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    self.smallText = smallText;
    smallText.centerX = self.view.centerX;
    smallText.centerY = self.view.bounds.size.height * 0.9;
    [self.collectionView addSubview:smallText];
    //guideLIne
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    //调整线的位置
    guideLine.centerX -= 180;
    [self.collectionView addSubview:guideLine];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    //根据编号设置每一个背景图片
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    cell.image = [UIImage imageNamed:imageName];
    [cell setIndexPath:indexPath count:4];
    return cell;
}

//当界面停止滚动时调用方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    //滚动得差值
    CGFloat delat = offsetX - _lastOffsetX;
//    _guide.x +=  delat;
//    _largerText.x +=  delat;
//    _smallText.x += delat;
   // 动画效果:先滚动2倍的差值 再返回一个差值 实现图片从左侧进入的效果
    
    _guide.x += 2 * delat;
    _largerText.x += 2 * delat;
    _smallText.x += 2 * delat;
    
    [UIView animateWithDuration:.5 animations:^{
        _guide.x -=  delat;
        _largerText.x -=  delat;
        _smallText.x -=  delat;
    }];
    _lastOffsetX = offsetX;
    int page = offsetX / self.view.width + 1;
    NSString *guideName = [NSString stringWithFormat:@"guide%d",page];
    _guide.image = [UIImage imageNamed:guideName];
    _largerText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%d",page]];
    _smallText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%d",page]];
}


@end
