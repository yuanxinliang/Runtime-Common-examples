//
//  YXLMovie.h
//  8.Runtime实现NSCoding的自动归档和解档
//
//  Created by 袁鑫亮 on 2017/6/26.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import <Foundation/Foundation.h>

//1. 如果想要当前类可以实现归档与反归档，需要遵守一个协议NSCoding
@interface YXLMovie : NSObject<NSCoding>
@property (nonatomic, copy) NSString *movieID;
@property (nonatomic, copy) NSString *movieName;
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, copy) NSString *moviePrice;

- (void)play;
@end
