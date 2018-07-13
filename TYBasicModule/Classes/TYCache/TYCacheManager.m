//
//  TYCacheManager.m
//  Basic
//
//  Created by TTSiMac on 2018/7/13.
//  Copyright © 2018年 tts.com. All rights reserved.
//

#import "TYCacheManager.h"
#import <YYCache.h>

static NSString *const TYCacheName = @"TYCacheName";

@interface TYCacheManager()


@end
@implementation TYCacheManager

static YYCache *_dataCache;


+(void)initialize
{
    _dataCache = [YYCache cacheWithName:TYCacheName];
}
+(void)saveObject:(id)object forKey:(NSString *)key
{
    [_dataCache setObject:object forKey:key];

}
+(id)objectForKey:(NSString *)key
{
    return [_dataCache objectForKey:key];
}
+(void)removeObjectForKey:(NSString *)key
{
    [_dataCache removeObjectForKey:key];
}
+(void)removeAllObjects
{
    [_dataCache removeAllObjects];
}

@end
