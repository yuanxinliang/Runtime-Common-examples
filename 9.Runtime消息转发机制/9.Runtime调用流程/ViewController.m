//
//  ViewController.m
//  9.Runtime调用流程
//
//  Created by 袁鑫亮 on 2017/6/26.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "YXLPerson.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    YXLPerson *person = [[YXLPerson alloc] init];
    [person run];
    NSDictionary *dic;
    NSObject *item = [[NSObject alloc] init];
    [item setValuesForKeysWithDictionary:dic];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [item setValue:obj forKey:key];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
