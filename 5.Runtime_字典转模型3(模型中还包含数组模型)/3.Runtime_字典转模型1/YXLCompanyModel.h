//
//  YXLCompanyModel.h
//  3.Runtime_字典转模型1
//
//  Created by 袁鑫亮 on 2017/6/24.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXLCompanyModel : NSObject
@property (nonatomic, copy) NSString *companyName;
@property (nonatomic, assign) NSInteger companyID;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *postal;
@property (nonatomic, copy) NSString *phone;
@end
