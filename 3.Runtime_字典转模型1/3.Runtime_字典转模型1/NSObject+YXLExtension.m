//
//  NSObject+YXLExtension.m
//  3.Runtime_字典转模型1
//
//  Created by 袁鑫亮 on 2017/6/24.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "NSObject+YXLExtension.h"
#import <objc/message.h>

@implementation NSObject (YXLExtension)
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    // 1.创建对应的对象
    id objc = [[self alloc] init];
    
    // 2.利用runtime给对象中的属性赋值
    /**
     class_copyIvarList: 获取类中的所有成员变量
     Ivar：成员变量
     第一个参数：表示获取哪个类中的成员变量
     第二个参数：表示这个类有多少成员变量，传入一个Int变量地址，会自动给这个变量赋值
     返回值Ivar *：指的是一个ivar数组，会把所有成员属性放在一个数组中，通过返回的数组就能全部获取到。
     count: 成员变量个数
     */
    unsigned int count = 0;
    //获取类中的所有成员变量
    Ivar *ivarList = class_copyIvarList(self, &count);
    //遍历所有成员变量
    for (NSInteger i = 0; i < count; i++) {
        //从数据中取出对应的成员变量
        Ivar ivar = ivarList[i];
        //获取成员变量名字
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        //处理成员变量名 -> 字典中的key (去掉_,从第一个角标开始截取)
        NSString *key = [ivarName substringFromIndex:1];
        //根据成员属性名去字典中查找对应的value
        id vaule = dict[key];
        
        // 【如果模型属性数量大于字典键值对数理，模型属性会被赋值为nil】
        // 而报错 (could not set nil as the value for the key age.)
        if (vaule) {
            //给模型中的属性赋值
            [objc setValue:vaule forKey:key];
        }
    }
    
    return objc;
}
@end
