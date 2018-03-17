//
//  UINavigationItem+YXLSwizzling.m
//  10.Runtime Method Swizzling(黑魔法)
//
//  Created by 袁鑫亮 on 2017/6/27.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "UINavigationItem+YXLSwizzling.h"
#import "NSObject+YXLMethodSwizzling.h"

@implementation UINavigationItem (YXLSwizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSeletor:@selector(backBarButtonItem) swizzledSelector:@selector(yxl_backBarButtonItem)];
    });
}

static char * const customBackBarButtonItemKey = "customBackBarButtonItemKey";
- (UIBarButtonItem *)yxl_backBarButtonItem {
    UIBarButtonItem *backItem = [self yxl_backBarButtonItem];
    if (backItem) {
        return backItem;
    }
    backItem = objc_getAssociatedObject(self, customBackBarButtonItemKey);
    if (backItem == nil) {
        backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
        objc_setAssociatedObject(self, customBackBarButtonItemKey, backItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return backItem;
}

@end
