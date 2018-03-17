//
//  YXLMovie.m
//  8.Runtime实现NSCoding的自动归档和解档
//
//  Created by 袁鑫亮 on 2017/6/26.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "YXLMovie.h"
#import <objc/message.h>

#define runtime_EncodeWithClassName(ClassName) \
\
unsigned int count = 0;\
Ivar *ivarList = class_copyIvarList([ClassName class], &count);\
for (NSInteger i = 0; i < count; i ++) {\
    Ivar ivar = ivarList[i];\
    NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];\
    id value = [self valueForKey:key];\
    [aCoder encodeObject:value forKey:key];\
}\
free(ivarList);\
\

#define runtime_InitCoderWithClassName(ClassName) \
\
if (self = [super init]) {\
unsigned int count = 0;\
Ivar *ivarList = class_copyIvarList([YXLMovie class], &count);\
for (NSInteger i = 0; i < count; i++) {\
    Ivar ivar = ivarList[i];\
    NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];\
    id value = [aDecoder decodeObjectForKey:key];\
    [self setValue:value forKey:key];\
}\
free(ivarList);\
}\
return self;\
\

@implementation YXLMovie

/**
 重写：归档
 */
- (void)encodeWithCoder:(NSCoder *)aCoder {
//    unsigned int count = 0;
//    Ivar *ivarList = class_copyIvarList([YXLMovie class], &count);
//    for (NSInteger i = 0; i < count; i ++) {
//        Ivar ivar = ivarList[i];
//        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
//        id value = [self valueForKey:key];
//        [aCoder encodeObject:value forKey:key];
//    }
//    free(ivarList);
    runtime_EncodeWithClassName(YXLMovie)
}

/**
 重写：解档
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super init]) {
//        unsigned int count = 0;
//        Ivar *ivarList = class_copyIvarList([YXLMovie class], &count);
//        for (NSInteger i = 0; i < count; i++) {
//            Ivar ivar = ivarList[i];
//            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
//            id value = [aDecoder decodeObjectForKey:key];
//            [self setValue:value forKey:key];
//        }
//        free(ivarList);
//    }
//    return self;
    runtime_InitCoderWithClassName(YXLMovie)
}

- (NSString *)description {
    return [NSString stringWithFormat:@"-- %@ --,-- %@ --,-- %@ --,-- %@ --.", self.movieID, self.movieName, self.picUrl, self.moviePrice];
}

- (void)play {
    NSLog(@"播放.....");
}

@end
