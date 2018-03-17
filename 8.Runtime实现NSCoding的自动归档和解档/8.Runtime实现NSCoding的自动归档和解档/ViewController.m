//
//  ViewController.m
//  8.Runtime实现NSCoding的自动归档和解档
//
//  Created by 袁鑫亮 on 2017/6/26.
//  Copyright © 2017年 yxl. All rights reserved.
//

#import "ViewController.h"
#import "YXLMovie.h"
#import <objc/message.h>

@interface ViewController ()
@property (nonatomic, copy) NSString *archivePath;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.archivePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"movie.archive"];
    YXLMovie *movie = [[YXLMovie alloc] init];
    movie.movieID = @"19090901132";
    movie.movieName = @"变形金刚5";
    movie.picUrl = @"baidu.com/ui.png";
    movie.moviePrice = @"100";
    if ([NSKeyedArchiver archiveRootObject:movie toFile:self.archivePath]) {
        NSLog(@"归档成功");
    } else {
        NSLog(@"归档失败");
    }
    
    
    objc_msgSend(movie, @selector(play));
    NSLog(@"%@",objc_msgSend(movie, @selector(movieName)));
    objc_msgSend(self, @selector(test:), @"123");
    
}

- (void)test:(NSString *)string {
    NSLog(@"%s -- %@ --",__func__,string);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YXLMovie *movie = [NSKeyedUnarchiver unarchiveObjectWithFile:self.archivePath];
    NSLog(@"%@",movie);
}


@end
