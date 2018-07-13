//
//  TYMacrosFunction.h
//  Basic
//
//  Created by TTSiMac on 2018/7/12.
//  Copyright © 2018年 tts.com. All rights reserved.
//

#ifndef TYMacrosFunction_h
#define TYMacrosFunction_h

/**只在debug下输出的log*/
#ifdef DEBUG
#define TYLogDebug(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define TYLogDebug(...)
#endif
/**判断字符串为空*/
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
/**判断数组为空*/
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
/**判断字典为空*/
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
/**判断Object为空*/
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
/**获本地图片*/
#define GetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]


#endif /* TYMacrosFunction_h */
