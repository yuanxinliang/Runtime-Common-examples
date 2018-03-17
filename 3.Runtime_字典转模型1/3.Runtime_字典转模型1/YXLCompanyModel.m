//
//  YXLCompanyModel.m
//  3.Runtime_字典转模型1
//
//  Created by 袁鑫亮 on 2017/6/24.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "YXLCompanyModel.h"

@interface YXLCompanyModel()
@property (nonatomic, copy) NSString *contacts;

@end

@implementation YXLCompanyModel
- (NSString *)description {
    return [NSString stringWithFormat:@"companyName -- %@, companyID -- %ld, address -- %@, postal -- %@, phone -- %@, contacts -- %@.", self.companyName, self.companyID, self.address, self.postal, self.phone,self.contacts];
}
@end
