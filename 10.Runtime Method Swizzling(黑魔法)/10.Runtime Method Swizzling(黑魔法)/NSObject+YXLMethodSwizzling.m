//
//  NSObject+YXLMethodSwizzling.m
//  10.Runtime Method Swizzling(黑魔法)
//
//  Created by 袁鑫亮 on 2017/6/26.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "NSObject+YXLMethodSwizzling.h"
#import <UIKit/UIKit.h>

@implementation NSObject (YXLMethodSwizzling)

+ (void)methodSwizzlingWithOriginalSeletor:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector {
    Class class = [self class];
    // 原有的方法
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    // 替换原有方法的新方法
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    // 先尝试给源SEL添加IMP,这里是为了避免源SEL没有实现IMP的情况
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) { // 添加成功：说明源SEL没有实现IMP，将源SEL的IMP替换到交换SEL的IMP
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else { // 添加失败：说明源SEL已经有了IMP，直接将两个SEL的IMP交换即可
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
