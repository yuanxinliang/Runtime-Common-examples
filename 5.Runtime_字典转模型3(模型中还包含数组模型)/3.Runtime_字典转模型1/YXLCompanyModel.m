//
//  YXLCompanyModel.m
//  3.Runtime_字典转模型1
//
//  Created by 袁鑫亮 on 2017/6/24.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "YXLCompanyModel.h"
#import "YXLDepartment.h"
#import "YXLSubCompany.h"
@interface YXLCompanyModel()
@property (nonatomic, copy) NSString *contacts;
@property (nonatomic, strong) YXLDepartment *department;
@property (nonatomic, copy) NSArray <YXLSubCompany *> *subCompanies;
@end

@implementation YXLCompanyModel

+ (NSDictionary *)arrayContainModelClass {
    return @{@"subCompanies" : @"YXLSubCompany"};
}

- (NSString *)description {
    return [NSString stringWithFormat:@"companyName -- %@, companyID -- %ld, address -- %@, postal -- %@, phone -- %@, contacts -- %@, deparment.name -- %@, deparment.contacts -- %@.", self.companyName, self.companyID, self.address, self.postal, self.phone, self.contacts, self.department.name, self.department.contacts];
}

@end
