//
//  UIViewController+YXLExtension.m
//  10.Runtime Method Swizzling(黑魔法)
//
//  Created by 袁鑫亮 on 2017/6/27.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "UIViewController+YXLExtension.h"
#import "NSObject+YXLMethodSwizzling.h"
#import <Foundation/Foundation.h>

@implementation UIViewController (YXLExtension)
+ (void)load {
    [self methodSwizzlingWithOriginalSeletor:@selector(viewWillAppear:) swizzledSelector:@selector(yxl_viewWillAppear:)];
}

static NSInteger i = 0;
- (void)yxl_viewWillAppear:(BOOL)animated {
    [self yxl_viewWillAppear:animated];
    i++;
    NSLog(@"%s -- %ld --", __func__, i);
}
@end
