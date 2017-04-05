//
//  LricPlayView.m
//  MusicPlayer
//
//  Created by DEVP-IOS-03 on 2017/3/31.
//  Copyright © 2017年 Hangzhou Jiyuan Jingshe Trade Co,. Ltd. All rights reserved.
//

#import "LricPlayView.h"



@interface LricPlayView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
@property(nonatomic,strong)UICollectionView         *collectionView;
@property(nonatomic,strong)NSMutableDictionary      *heightDictionary;
@end


@implementation LricPlayView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super initWithCoder:aDecoder]) {
        [self setupUI];
    }
    return self;
}

- (void)setLricArray:(NSArray *)lricArray{
    _lricArray = lricArray;
    [self.collectionView reloadData];
}

- (void)initData{
    self.heightDictionary = [NSMutableDictionary dictionary];
}

- (void)setupUI
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;

    self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;

    UINib *nib = [UINib nibWithNibName:@"LricLabelCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"LricLabelCollectionViewCellReuseID"];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size;
    float heightLyric;
    NSString *key = [NSString stringWithFormat:@"%ld",indexPath.item];
    if ([self.heightDictionary valueForKey:key]) {
        LyricModel *model       = self.lricArray[indexPath.row];
        heightLyric             = [model.content jk_heightWithFont:nil constrainedToWidth:self.jk_width];
        size                    = CGSizeMake(self.jk_width, heightLyric);
        [self.heightDictionary setValue:[NSNumber numberWithFloat:heightLyric] forKey:key];
    }else{
        heightLyric             = [[self.heightDictionary valueForKey:key] floatValue];
        size                    = CGSizeMake(self.jk_width, heightLyric);
    }
    return size;
}


#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.lricArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView                                              // any offset changes
{

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{

}


@end
