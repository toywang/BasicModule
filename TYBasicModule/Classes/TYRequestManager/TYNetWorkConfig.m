//
//  TYNetWorkConfig.m
//  Basic
//
//  Created by TTSiMac on 2018/7/12.
//  Copyright © 2018年 tts.com. All rights reserved.
//

#import "TYNetWorkConfig.h"

@implementation TYNetWorkConfig

+(instancetype)config
{
    static TYNetWorkConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[self alloc]init];
    });
    return config;
}
@end
