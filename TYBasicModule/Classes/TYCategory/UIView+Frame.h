//
//  UIView+Frame.h
//  Basic
//
//  Created by TTSiMac on 2018/7/13.
//  Copyright © 2018年 tts.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign,readonly) CGFloat minX;
@property (nonatomic, assign,readonly) CGFloat minY;
@property (nonatomic, assign,readonly) CGFloat maxX;
@property (nonatomic, assign,readonly) CGFloat maxY;
@end
