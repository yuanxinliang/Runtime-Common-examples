//
//  NSObject+YXLExtension.h
//  3.Runtime_字典转模型1
//
//  Created by 袁鑫亮 on 2017/6/24.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  KeyValue协议
 */
@protocol YXLKeyValue <NSObject>
@optional
+ (NSDictionary *)arrayContainModelClass;
@end

@interface NSObject (YXLExtension)
+ (instancetype)modelWithDict:(NSDictionary *)dict;
@end
