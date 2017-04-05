//
//  LocalMusicPlayerManager.h
//  MusicPlayer
//
//  Created by DEVP-IOS-03 on 2017/4/5.
//  Copyright © 2017年 Hangzhou Jiyuan Jingshe Trade Co,. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LocalMusicPlayerManager;

@protocol LocalMusicPlayManagerDelegate <NSObject>

- (void)  playerManager:(LocalMusicPlayerManager *) playerManager didFinishedWithFlag:(BOOL) isSuccess;


@end


@interface LocalMusicPlayerManager : NSObject
@property (nonatomic, weak) id<LocalMusicPlayManagerDelegate> delegate;
@property (nonatomic, assign) NSTimeInterval currentTime;
@property (nonatomic, assign,readonly) NSTimeInterval duration;

+ (instancetype) sharedPlayerManager;

/// 准备播放
- (void) prepareToPlayWithMusic:(WTMusic *) music;

- (void) play;

- (void) pause;


@end
