//
//  ViewController.m
//  1.Runtime_动态交换两个方法的实现
//
//  Created by 袁鑫亮 on 2017/6/23.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+YXLExtension.h"
@interface ViewController ()

@end

@implementation ViewController


/**
 
 runtime 交换方法
 
 应用场景：当第三方框架 或者 系统原生方法功能不能满足我们的时候，我们可以在保持系统原有方法功能的基础上，添加额外的功能。
 
 需求：加载一张图片直接用[UIImage imageNamed:@"image"];是无法知道到底有没有加载成功。给系统的imageNamed添加额外功能（是否加载图片成功）。
 
 方案一：继承系统的类，重写方法.（弊端：每次使用都需要导入）
 方案二：使用 runtime，交换方法.
 实现步骤：
 
 1.给系统的方法添加分类
 2.自己实现一个带有扩展功能的方法
 3.交换方法,只需要交换一次,
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image1 = [UIImage imageNamed:@"yxl"];
    NSLog(@"--- %@ ---",image1);
    
    UIImage *image2 = [UIImage imageNamed:@"helpdesk"];
    NSLog(@"--- %@ ---",image2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
