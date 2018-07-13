//
//  TYShowHUD.m
//  Basic
//
//  Created by TTSiMac on 2018/7/13.
//  Copyright © 2018年 tts.com. All rights reserved.
//

#import "TYShowHUD.h"
#import "SVProgressHUD.h"
#import "MBProgressHUD.h"
#import "XHToast.h"
#import "TYMacrosFunction.h"

@implementation TYShowHUD
+(void)show
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
}
+(void)dismiss
{
    [SVProgressHUD dismiss];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
}
+(void)showErrorWithStatus:(NSString *)message
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showErrorWithStatus:message];
}
+(void)showSuccessWithStatus:(NSString *)message
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showSuccessWithStatus:message];
}
+(void)showWithStatus:(NSString *)message
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:message];
}
+(void)showToastText:(NSString *)text
{
    //    [XHToast showCenterWithText:text];
    [XHToast showBottomWithText:text];
    
}
+(void)showCollectionSuccess
{
    [SVProgressHUD setSuccessImage:GetImage(@"collection")];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showSuccessWithStatus:@"收藏成功"];
}
+ (void)showCollectionWithImage:(UIImage *)image
{
    [SVProgressHUD setSuccessImage:image];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showSuccessWithStatus:@"收藏成功"];
}
+(void)showLoadingView
{
//    UIViewController *visiView = [[UIApplication sharedApplication] findTopViewController];
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:visiView.view animated:YES];
//    hud.activityIndicatorColor = TABFONTCOLOR;
//    [hud showAnimated:YES];
}
+ (void)showLoadingViewWithColor:(UIColor *)color
{
    
    
}
+(void)dismissLoadingView
{
//    UIViewController *visiView = [[UIApplication sharedApplication] findTopViewController];
//    [MBProgressHUD hideHUDForView:visiView.view animated:YES];
}
@end
