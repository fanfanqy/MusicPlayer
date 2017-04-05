//
//  LyricParser.h
//  MusicPlayer
//
//  Created by DEVP-IOS-03 on 2017/4/5.
//  Copyright © 2017年 Hangzhou Jiyuan Jingshe Trade Co,. Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LyricParser : NSObject

+(NSArray *)lyricParseWithLyricFileName:(NSString *)fileName;

@end
