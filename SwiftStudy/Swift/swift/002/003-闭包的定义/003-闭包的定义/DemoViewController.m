//
//  DemoViewController.m
//  003-闭包的定义
//
//  Created by 今代科技 on 2017/9/13.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 最简单的block
    void (^b1)() = ^{
        NSLog(@"hello");
    };
    b1();
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
