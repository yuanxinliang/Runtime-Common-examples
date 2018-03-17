//
//  UILabel+YXLSwizzling.m
//  10.Runtime Method Swizzling(黑魔法)
//
//  Created by 袁鑫亮 on 2017/6/27.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "UILabel+YXLSwizzling.h"
#import "NSObject+YXLMethodSwizzling.h"

@implementation UILabel (YXLSwizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSeletor:@selector(init) swizzledSelector:@selector(yxl_init)];
        [self methodSwizzlingWithOriginalSeletor:@selector(initWithFrame:) swizzledSelector:@selector(yxl_initWithFrame:)];
        [self methodSwizzlingWithOriginalSeletor:@selector(awakeFromNib) swizzledSelector:@selector(yxl_awakeFromNib)];
    });
}

- (instancetype)yxl_init {
    id __self = [self yxl_init];
    self.font = [UIFont systemFontOfSize:30];
    return __self;
}

- (instancetype)yxl_initWithFrame:(CGRect)frame {
    id __self = [self yxl_initWithFrame:frame];
    self.font = [UIFont systemFontOfSize:30];
    return __self;
}

- (void)yxl_awakeFromNib {
    [self yxl_awakeFromNib];
    self.font = [UIFont systemFontOfSize:30];
}

@end
