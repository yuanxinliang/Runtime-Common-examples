//
//  ViewController.m
//  6.Runtime动态添加方法
//
//  Created by 袁鑫亮 on 2017/6/24.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+YXLExtension.h"
#import "YXLPersonModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    YXLPersonModel *person = [[YXLPersonModel alloc] init];
    [person performSelector:@selector(run:) withObject:@(10)];
    NSString *string = [person performSelector:@selector(compareNumberWithA:b:) withObject:@100 withObject:@200];
    NSLog(@"%@",string);
    [person performSelector:@selector(methodLogWithObject1:object2:object3:) withObjects:@[@"1",@"11",@"111"]];
}



@end
