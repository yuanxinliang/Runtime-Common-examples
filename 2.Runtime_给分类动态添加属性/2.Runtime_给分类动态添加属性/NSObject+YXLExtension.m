//
//  NSObject+YXLExtension.m
//  2.Runtime_给分类动态添加属性
//
//  Created by 袁鑫亮 on 2017/6/23.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "NSObject+YXLExtension.h"
#import <objc/message.h>

@implementation NSObject (YXLExtension)

static char * const kName = "name";
- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, kName, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, kName);
}

static char * const KNumber = "number";
- (void)setNumber:(NSInteger)number {
    objc_setAssociatedObject(self, KNumber, @(number), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)number {
    return [objc_getAssociatedObject(self, KNumber) integerValue];
}


@end
