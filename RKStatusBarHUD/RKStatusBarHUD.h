//
//  RKStatusBarHUD.h
//  RKStatusBarHUD
//
//  Created by rock on 17/8/9.
//  Copyright © 2017年 rock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKStatusBarHUD : NSObject

/** 加载成功*/
+ (void)showSuccessWithStatus:(NSString *)message;
/** 加载普通信息*/
+ (void)showStatus:(NSString *)message;
/** 加载普通信息带图标*/
+ (void)showStatus:(NSString *)message image:(NSString *)image;
/** 加载错误信息*/
+ (void)showErrorWithStatus:(NSString *)message;
/** 加载中*/
+ (void)showLoading;
/** 隐藏窗口*/
+ (void)hide;

@end
