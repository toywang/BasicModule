//
//  TYCacheManager.h
//  Basic
//
//  Created by TTSiMac on 2018/7/13.
//  Copyright © 2018年 tts.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TYCacheManager : NSObject

/**缓存对象*/
+ (void)saveObject:(id)object forKey:(NSString*)key;
/**获取缓存对象*/
+ (id)objectForKey:(NSString*)key;
/**移除缓存对象*/
+ (void)removeObjectForKey:(NSString*)key;
/**清空缓存*/
+ (void)removeAllObjects;
@end
