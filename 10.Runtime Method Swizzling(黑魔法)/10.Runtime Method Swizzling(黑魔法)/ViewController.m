//
//  ViewController.m
//  10.Runtime Method Swizzling(黑魔法)
//
//  Created by 袁鑫亮 on 2017/6/26.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "UIButton+YXLSwizzling.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *arrayM = [NSMutableArray array];
    [arrayM addObject:@"123"];
    [arrayM objectAtIndex:2];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
//    btn.isIgnore = YES;
//    btn.timeInterval = 10;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    label.text = @"123";
    [self.view addSubview:label];
    
}

- (void)clickAction {
    NSLog(@"123");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FirstViewController *vc = [FirstViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
