//
//  YXLPerson.m
//  9.Runtime调用流程
//
//  Created by 袁鑫亮 on 2017/6/26.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "YXLPerson.h"
#import "YXLPlayer.h"
#import <objc/message.h>

@implementation YXLPerson

/**
 1，首先看是否为该 selector 供了动态方法决议机制，如果 供了则转到 2;如果没有 供则转到 3;
 
 2，如果动态方法决议真正为该selector 供了实现，那么就调用该实现，完成消息发送流程，消息转发 就不会进行了;如果没有 供，则转到 3;
 
 3，其次看是否为该selector 供了消息转发机制，如果 供了消息了则进行消息转发，此时，无论消息 转发是怎样实现的，程序均不会crash。(因为消息调用的控制权完全交给消息转发机制处理，即使消息转发并没有做任何事情，运行也不会有错误，编译器更不会有错误示。);如果没 供消息转发机制， 则转到 4;
 
 4，运行报错:无法识别的 selector，程序 crash;
 */


/**
 消息转发机制：第一种方案
 */

/*
void run(id self, SEL _cmd) {
    NSLog(@"跑起来");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s -- %@",__func__,NSStringFromSelector(sel));
    if (sel == NSSelectorFromString(@"run")) {
        class_addMethod(self, sel, (IMP)run, "v@:");
    }
    return [super resolveInstanceMethod:sel];
}
*/

/**
 消息转发机制：第二种方案
 */

/*
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%s -- %@",__func__,NSStringFromSelector(aSelector));
    if (aSelector == NSSelectorFromString(@"run")) {
        return [[YXLPlayer alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}
*/

/**
 消息转发机制：第三种方案
 */

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%s -- %@",__func__,NSStringFromSelector(aSelector));
    if (aSelector == NSSelectorFromString(@"run")) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%s -- %@",__func__,anInvocation);
    YXLPlayer *player = [[YXLPlayer alloc] init];
    if ([player respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:player];
    } else {
        [super forwardInvocation:anInvocation];
    }
    
}


@end
