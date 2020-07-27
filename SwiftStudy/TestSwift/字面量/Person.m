//
//  Person.m
//  字面量
//
//  Created by zainguo on 2020/7/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "Person.h"
#import "字面量-Swift.h"
@implementation Person

- (instancetype)initWithAge:(NSInteger)age name:(NSString *)name {
    if (self = [super init]) {
        self.age = age;
        self.name = name;
    }
    return self;
}
+ (instancetype)personWithAge:(NSInteger)age name:(NSString *)name {
    return [[self alloc] initWithAge:age name:name];
}

- (void)run {
    NSLog(@"%zd - %@ -run", _age, _name);
}
+ (void)run {
    NSLog(@"Person run");
}

- (void)eat:(NSString *)food other:(NSString *)other {
    NSLog(@"instance eat");
}
+ (void)eat:(NSString *)food other:(NSString *)other {
    NSLog(@"Person class eat");
}
int sum(int a, int b) {
    return a + b;
}
void testSwift() {
    NSLog(@"testSwift");
    Car *car = [[Car alloc] initWithPrice:120 band:@"宝马"];
    [car run];
}
@end
