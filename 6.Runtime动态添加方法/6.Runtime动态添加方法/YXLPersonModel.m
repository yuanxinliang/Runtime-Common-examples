//
//  YXLPersonModel.m
//  6.Runtime动态添加方法
//
//  Created by 袁鑫亮 on 2017/6/24.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "YXLPersonModel.h"
#import <objc/message.h>

@implementation YXLPersonModel

// 没有返回值,1个参数
// void (id,SEL)
void aaa(id self, SEL _cmd, NSNumber *meter) {
    NSLog(@"跑了%@米.", meter);
}

NSString * test1(id self, SEL _cmd, NSNumber *a, NSNumber *b) {
    if ([a integerValue] >= [b integerValue]) {
        return [NSString stringWithFormat:@"a的值 = %@ 大于等于b = %@.", a, b];
    } else if ([a integerValue] < [b integerValue]) {
        return [NSString stringWithFormat:@"a的值 = %@ 小于b = %@.", a, b];
    }
    return @"未知。。。。";
}

void method1(id self, SEL _cmd, NSString *name1, NSString *name2, NSString *name3) {
    NSLog(@"%@ -- %@ -- %@.", name1, name2, name3);
}

// 任何方法默认都有两个隐式参数,self,_cmd（当前方法的方法编号）
// 什么时候调用:只要一个对象调用了一个未实现的方法就会调用这个方法,进行处理
// 作用:动态添加方法,处理未实现
+ (BOOL) resolveInstanceMethod:(SEL)sel {
    if (sel == NSSelectorFromString(@"run:")) {
        // 动态添加run方法
        // class: 给哪个类添加方法
        // SEL: 添加哪个方法，即添加方法的方法编号
        // IMP: 方法实现 => 函数 => 函数入口 => 函数名（添加方法的函数实现（函数地址））
        // type: 方法类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd
        class_addMethod(self, sel, (IMP)aaa, "v@:@");
        return YES;
    } else if (sel == NSSelectorFromString(@"compareNumberWithA:b:")) {
        class_addMethod(self, sel, (IMP)test1, "@@:@@");
        return YES;
    } else if (sel == NSSelectorFromString(@"methodLogWithObject1:object2:object3:")) {
        class_addMethod(self, sel, (IMP)method1, "v@:@@@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
