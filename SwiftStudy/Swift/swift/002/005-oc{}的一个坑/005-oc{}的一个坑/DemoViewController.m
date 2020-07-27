//
//  DemoViewController.m
//  005-oc{}的一个坑
//
//  Created by 今代科技 on 2017/9/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * label = [[UILabel alloc] init];
    [self.view addSubview:label];
    //区分变量的作用域
    {
        UILabel * label = [[UILabel alloc] init];
        [self.view addSubview:label];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
