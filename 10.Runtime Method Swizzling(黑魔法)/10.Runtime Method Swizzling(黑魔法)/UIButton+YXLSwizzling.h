//
//  UIButton+YXLSwizzling.h
//  10.Runtime Method Swizzling(黑魔法)
//
//  Created by 袁鑫亮 on 2017/6/27.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 实例三：防止按钮重复暴力点击
 */

// 默认时间间隔
#define defaultInterval 1

@interface UIButton (YXLSwizzling)

/**
 点击间隔：默认时间间隔为1.Os
 */
@property (nonatomic, assign) NSTimeInterval timeInterval;

/**
 用于设置单个按钮不需要被hook
 */
@property (nonatomic, assign) BOOL isIgnore;

@end
