//
//  UIButton+YXLSwizzling.m
//  10.Runtime Method Swizzling(黑魔法)
//
//  Created by 袁鑫亮 on 2017/6/27.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "UIButton+YXLSwizzling.h"
#import "NSObject+YXLMethodSwizzling.h"

@implementation UIButton (YXLSwizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSeletor:@selector(sendAction:to:forEvent:) swizzledSelector:@selector(yxl_sendAction:to:forEvent:)];
    });
}

- (void)yxl_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (self.isIgnore) {
        NSLog(@"点击了 -- %d --", self.isIgnore);
        [self yxl_sendAction:action to:target forEvent:event];
        return;
    }
    
    if ([NSStringFromClass([self class]) isEqualToString:@"UIButton"]) {
        if (self.timeInterval == 0) {
            self.timeInterval = defaultInterval;
        }
        
        if (self.isIgnoreEvent) {
            NSLog(@"间隔时间内，不做事件处理");
            return;
        } else if (self.timeInterval > 0) {
            [self performSelector:@selector(resetState) withObject:nil afterDelay:self.timeInterval];
        }
    }
    
    self.isIgnoreEvent = YES;
    NSLog(@"点击了 -- %d --", self.isIgnore);
    [self yxl_sendAction:action to:target forEvent:event];
}

static char * const timeIntervalKey = "timeInterval";
- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    objc_setAssociatedObject(self, timeIntervalKey, @(timeInterval), OBJC_ASSOCIATION_ASSIGN);
}

- (NSTimeInterval)timeInterval {
    return [objc_getAssociatedObject(self, timeIntervalKey) floatValue];
}

static char * const isIgnoreKey = "isIgnoreKey";
- (void)setIsIgnore:(BOOL)isIgnore {
    objc_setAssociatedObject(self, isIgnoreKey, @(isIgnore), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isIgnore {
    return [objc_getAssociatedObject(self, isIgnoreKey) boolValue];
}



static char * const isIgnoreEventKey = "isIgnoreEventKey";
- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent {
    objc_setAssociatedObject(self, isIgnoreEventKey, @(isIgnoreEvent), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isIgnoreEvent {
    return [objc_getAssociatedObject(self, isIgnoreEventKey) boolValue];
}

- (void)resetState {
    [self setIsIgnoreEvent:NO];
}

@end
