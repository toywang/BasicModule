//
//  TYShowHUD.h
//  Basic
//
//  Created by TTSiMac on 2018/7/13.
//  Copyright © 2018年 tts.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TYShowHUD : NSObject

/**默认loading*/
+ (void)show;
/**dismiss*/
+ (void)dismiss;
/**默认Error*/
+ (void)showErrorWithStatus:(NSString *)message;
/**默认success*/
+ (void)showSuccessWithStatus:(NSString *)message;
/**默认status*/
+ (void)showWithStatus:(NSString *)message;
/**Toast 提示信息(居中)*/
+ (void)showToastText:(NSString *)text;
/**收藏成功*/
+ (void)showCollectionSuccess;
/**自定义收藏成功图标*/
+ (void)showCollectionWithImage:(UIImage *)image;
/**加载菊花*/
+ (void)showLoadingView;
/**自定义加载菊花颜色*/
+ (void)showLoadingViewWithColor:(UIColor *)color;
/**隐藏菊花*/
+(void)dismissLoadingView;
@end
