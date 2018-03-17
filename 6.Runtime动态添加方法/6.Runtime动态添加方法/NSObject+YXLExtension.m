//
//  NSObject+YXLExtension.m
//  6.Runtime动态添加方法
//
//  Created by 袁鑫亮 on 2017/6/24.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "NSObject+YXLExtension.h"

@implementation NSObject (YXLExtension)

/**
 - (id)performSelector:(SEL)aSelector; 没有参数
 - (id)performSelector:(SEL)aSelector withObject:(id)object; 一个参数
 - (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2; 两个参数
 - (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects 自定义的函数 参数是传入一个数组
 补充一个当参数有2个以上时
 */
- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects {
    // 方法签名（方法的描述）
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:aSelector];
    if (signature == nil) {
        // 这里可以抛出异常也可以不操作
    }
    // NSInvocation : 利用一个NSInvocation对象包装一次方法调用（方法调用者、方法名、方法参数、方法返回值）
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = aSelector;
    
    // 设置参数
    NSInteger paramsCount = signature.numberOfArguments - 2; // 除self、_cmd以外的参数个数
    paramsCount = MIN(paramsCount, objects.count);
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = objects[i];
        if ([object isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&object atIndex:i + 2];
    }
    
    // 调用方法
    [invocation invoke];
    
    // 获取返回值
    id returnValue = nil;
    if (signature.methodReturnLength) { // 有返回值类型，才去获得返回值
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}
@end
