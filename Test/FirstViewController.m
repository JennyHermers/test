//
//  FirstViewController.m
//  Test  block使用
//
//  Created by 徐金洁 on 2017/6/15.
//  Copyright © 2017年 tele-hot. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

/*
 
 作用:
 
 Block封装了一段代码，可以在任何时候执行
 
 Block可以作为函数参数或者函数的返回值，而本身又可以带输入参数或返回值
 
 block，在多线程、异步任务，集合遍历，集合排序、动画专场用得多
 
 */



//block用来保存一段代码

//block的标志 :^

//block跟函数指针很像


typedef int (^SumP)(int,int);//用typedef定义一个block类型
typedef void(^SayHello)();
//1、定义block变量没有返回值没有参数

int (^addblock)(int,int)= ^(int a,int b){
    return a + b;
};


void (^strblock)(NSString*,NSString*) = ^(NSString *a,NSString *b){
    NSLog(@"%@===%@", a, b);
};

SumP sumblock1 = ^(int a,int b){
    
    return a - b;
    
};

SayHello hello = ^(){
    NSLog(@"hello");
};

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%d",addblock(1,4));
    strblock(@"chcg",@"b");
    
    int d = sumblock1(10,5);
    
    NSLog(@"d = %d",d);
}


@end
