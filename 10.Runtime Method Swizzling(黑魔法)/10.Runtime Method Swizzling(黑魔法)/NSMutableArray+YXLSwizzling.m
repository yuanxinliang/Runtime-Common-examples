//
//  NSMutableArray+YXLSwizzling.m
//  10.Runtime Method Swizzling(黑魔法)
//
//  Created by 袁鑫亮 on 2017/6/27.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "NSMutableArray+YXLSwizzling.h"
#import "NSObject+YXLMethodSwizzling.h"

@implementation NSMutableArray (YXLSwizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSeletor:@selector(addObject:) swizzledSelector:@selector(yxl_addObject:)];
        [objc_getClass("__NSArrayM") methodSwizzlingWithOriginalSeletor:@selector(objectAtIndex:) swizzledSelector:@selector(yxl_objectAtIndex:)];
    });
}

- (void)yxl_addObject:(id)anObject {
    if (anObject == nil) {
        NSLog(@"%s 失败：添加元素不能为空.", __FUNCTION__);
    } else {
        [self yxl_addObject:anObject];
    }
}

- (id)yxl_objectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@"%s 失败：可变数组中没有元素.", __FUNCTION__);
        return nil;
    } else if (self.count <= index) {
        NSLog(@"%s 失败：数组越界.", __FUNCTION__);
        return nil;
    } else {
        return [self yxl_objectAtIndex:index];
    }
}

@end
