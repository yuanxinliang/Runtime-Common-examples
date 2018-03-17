//
//  ViewController.m
//  7.Runtime动态变量控制
//
//  Created by 袁鑫亮 on 2017/6/26.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "YXLPerson.h"
#import "YXLMan.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YXLPerson *person = [[YXLPerson alloc] init];
    YXLMan *man = [[YXLMan alloc] init];
    person.man = man;
    unsigned int count = 0;
    Ivar *ivar = class_copyIvarList([person.man class], &count);
    for (NSInteger i = 0; i < count; i++) {
        Ivar var = ivar[i];
        NSString *name = [NSString stringWithUTF8String:ivar_getName(var)];
        if ([name isEqualToString:@"_age"]) {
            object_setIvar(person.man, var, @20);
            break; //跳出for循环
        }
    }
    NSLog(@"%@",person.man);
}

@end
