//
//  YXLPerson.h
//  7.Runtime动态变量控制
//
//  Created by 袁鑫亮 on 2017/6/26.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXLMan.h"

@interface YXLPerson : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, strong) YXLMan *man;
@end
