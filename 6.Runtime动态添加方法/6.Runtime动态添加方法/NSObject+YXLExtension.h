//
//  NSObject+YXLExtension.h
//  6.Runtime动态添加方法
//
//  Created by 袁鑫亮 on 2017/6/24.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Method协议
 */
@protocol YXLMethod <NSObject>
@optional
- (void)run:(NSNumber *)meter;
- (NSString *)compareNumberWithA:(NSNumber *)a b:(NSNumber *)b;
- (void)methodLogWithObject1:(id)object1 object2:(id)object2 object3:(id)object3;
@end

@interface NSObject (YXLExtension)

/**
 - (id)performSelector:(SEL)aSelector; 没有参数
 - (id)performSelector:(SEL)aSelector withObject:(id)object; 一个参数
 - (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2; 两个参数
 - (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects 自定义的函数 参数是传入一个数组
 补充一个当参数有2个以上时
 */
- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects;
@end
