//
//  RKStatusBarHUD.m
//  RKStatusBarHUD
//
//  Created by rock on 17/8/9.
//  Copyright © 2017年 rock. All rights reserved.
//

#import "RKStatusBarHUD.h"
/** 窗口*/
static UIWindow *window_;
/** 定时器*/
static NSTimer *timer_;
/** 消息框高度*/
static CGFloat const RKStatusBarH = 20;
/** 时间间隔*/
static CGFloat const RKStatusBarDeay = 0.25;
/** 字体大小*/
#define RKStatusBarFont [UIFont systemFontOfSize:12]

#define RKScreenW [UIScreen mainScreen].bounds.size.width
#define RKScreenH [UIScreen mainScreen].bounds.size.height

@implementation RKStatusBarHUD

+ (void)showWindow{
    
    CGRect frame = CGRectMake(0, - RKStatusBarH, RKScreenW, RKStatusBarH);
    
    window_ = [[UIWindow alloc] init];
    
    window_.frame = frame;
    
    window_.windowLevel = UIWindowLevelAlert;
    
    window_.hidden = NO;
    
    frame.origin.y = 0;
    
    [UIView animateWithDuration:RKStatusBarDeay animations:^{
        window_.frame = frame;
    }];
    
    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  加载成功信息
 *
 *  @param message 消息
 */
+ (void)showSuccessWithStatus:(NSString *)message{
    
    [self showStatus:message image:@"RKStatusBarHUD.bundle/success"];
    
}

/**
 *  加载失败信息
 *
 *  @param message 消息
 */
+ (void)showErrorWithStatus:(NSString *)message{
    [self showStatus:message image:@"RKStatusBarHUD.bundle/error"];
}

/**
 *  加载普通信息
 *
 *  @param message 消息
 */
+ (void)showStatus:(NSString *)message{
    [self showStatus:message image:nil];
}

/**
 *  加载普通消息带图标
 *
 *  @param message 消息
 *  @param image   图标
 */
+ (void)showStatus:(NSString *)message image:(NSString *)image{
    
    //停止定时器
    [timer_ invalidate];
    //清空定时器
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:message forState:UIControlStateNormal];
    btn.titleLabel.font = RKStatusBarFont;
    
    //判断是否有图片
    if (image) {
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    
    btn.frame = window_.bounds;
    
    [window_ addSubview:btn];
}

/**
 *  加载中
 *
 *  @param message 消息
 */
+ (void)showLoading{
    //停止定时器
    [timer_ invalidate];
    //清空定时器
    timer_ = nil;
    
    //显示窗口
    [self showWindow];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:@"加载中..." forState:UIControlStateNormal];
    btn.titleLabel.font = RKStatusBarFont;
    
    btn.frame = window_.bounds;
    
    [window_ addSubview:btn];
    
    //添加转菊花
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] init];
    
    activity.frame = CGRectMake(0, 0, RKStatusBarH, RKStatusBarH);
    
    [activity startAnimating];
    
    CGFloat textW = [btn.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:RKStatusBarFont}].width;
    
    CGFloat centerX = (RKScreenW - textW) * 0.5 - RKStatusBarH;
    CGFloat centerY = window_.frame.size.height * 0.5;
    
    activity.center = CGPointMake(centerX, centerY);
    
    [window_ addSubview:activity];
    
}

/**
 *  隐藏窗口
 */
+ (void)hide{
    
    [UIView animateWithDuration:RKStatusBarDeay animations:^{
        window_ = nil;
        timer_ = nil;
    }];
    
}

@end
