#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "TYBasicModule.h"
#import "TYCacheManager.h"
#import "UIView+Frame.h"
#import "TYShowHUD.h"
#import "TYMacrosFunction.h"
#import "TYNetWorkConfig.h"
#import "TYRequestManger.h"

FOUNDATION_EXPORT double TYBasicModuleVersionNumber;
FOUNDATION_EXPORT const unsigned char TYBasicModuleVersionString[];

