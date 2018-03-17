//
//  NSObject+YXLMethodSwizzling.h
//  10.Runtime Method Swizzling(黑魔法)
//
//  Created by 袁鑫亮 on 2017/6/26.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

@interface NSObject (YXLMethodSwizzling)
+ (void)methodSwizzlingWithOriginalSeletor:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;
@end
