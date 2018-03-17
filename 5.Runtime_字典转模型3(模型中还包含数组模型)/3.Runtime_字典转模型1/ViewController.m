//
//  ViewController.m
//  3.Runtime_字典转模型1
//
//  Created by 袁鑫亮 on 2017/6/24.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "YXLCompanyModel.h"
#import "NSObject+YXLExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CustomDictionary" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    YXLCompanyModel *company = [YXLCompanyModel modelWithDict:dic];
    NSLog(@"%@",[company description]);
}



@end
