//
//  ViewController.m
//  2.Runtime_给分类动态添加属性
//
//  Created by 袁鑫亮 on 2017/6/23.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+YXLExtension.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *string = @"123";
    string.name = @"NSString_name";
    string.number = 1000000;
    NSLog(@"%@ --- %ld",string.name,string.number);
}


@end
