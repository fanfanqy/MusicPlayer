//
//  LricPlayView.h
//  MusicPlayer
//
//  Created by DEVP-IOS-03 on 2017/3/31.
//  Copyright © 2017年 Hangzhou Jiyuan Jingshe Trade Co,. Ltd. All rights reserved.
//

#import "BasView.h"

@protocol LricPlayViewDelegate <NSObject>
@optional
- (void)Method1;

@end

@interface LricPlayView : BasView
@property(nonatomic,strong)NSArray *lricArray;
@property (nonatomic,assign) NSInteger currentLyricIndex;

@property (nonatomic,weak) id<LricPlayViewDelegate> delegate;
@end
