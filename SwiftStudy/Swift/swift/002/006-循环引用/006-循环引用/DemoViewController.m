//
//  DemoViewController.m
//  006-循环引用
//
//  Created by 今代科技 on 2017/9/17.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()
@property (nonatomic, copy) void (^completionBack)();


@end

@implementation DemoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
//    __weak typeof(self) weakSelf = self;
    // __unsafe_unretained 同样是 assign 的引用
    // 在MRC中如果要弱引用对象都是使用 assign , 不会增加引用计数, 但是一旦对象被释放, 地址不会释放, 继续访问, 出现野指针
    // 在ARC weak, 本质上是一个观察者模式, 一旦发现对象被释放, 会自动将地址设置为 nil, 更加完全
    // 效率: weak效率会差一点
    __unsafe_unretained typeof(self) weakSelf = self;
    
    // EXC_BAD_ACCESS 坏内存访问, 野指针访问
    [self loadData:^{
        NSLog(@"%@",weakSelf.view);
    }];
}
- (void)loadData:(void (^)())completion {
    self.completionBack = completion;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"耗时操作%@",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3.0];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion();
        });
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
