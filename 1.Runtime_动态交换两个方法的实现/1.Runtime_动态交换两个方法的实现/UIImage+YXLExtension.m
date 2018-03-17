//
//  UIImage+YXLExtension.m
//  1.Runtime_动态交换两个方法的实现
//
//  Created by 袁鑫亮 on 2017/6/23.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "UIImage+YXLExtension.h"
#import <objc/message.h>

@implementation UIImage (YXLExtension)

/**
 load方法：把类加载进去内存的时候调用，只会调用一次
 方法应先交换，再去调用
 */

+(void)load {
    // 1.获取 imageNamed 方法地址
    // class_getClassMethod (获取类方法)
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    // 2.获取 yxl_imageNamed 方法地址
    Method yxl_imageNamedMethod = class_getClassMethod(self, @selector(yxl_imageNamed:));
    // 3.交换方法地址，相当于交换实现方式。
    // method_exchangeImplementations 交换两个方法的实现
    method_exchangeImplementations(imageNamedMethod, yxl_imageNamedMethod);
    
}

+ (UIImage *)yxl_imageNamed:(NSString *)name {
    UIImage *image = [UIImage yxl_imageNamed:name];
    if (image != nil) {
        NSLog(@"--- 图片存在 ---");
    } else {
        NSLog(@"--- 图片不存在 ---");
    }
    return image;
}
@end
