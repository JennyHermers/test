//
//  ViewController.m
//  移动键盘
//
//  Created by 徐金洁 on 2017/6/13.
//  Copyright © 2017年 tele-hot. All rights reserved.
//
#define THScreenW [UIScreen mainScreen].bounds.size.width

#define THScreenH [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)UITextField *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITextField *textView = [[UITextField alloc]init];
    textView.frame = CGRectMake(0,THScreenH-100, THScreenW, 80);
    textView.font = [UIFont systemFontOfSize:16];
    textView.backgroundColor = [UIColor redColor];
    self.textView = textView;
    textView.placeholder = @"请输入文字";
    [self.view addSubview:textView];

    //点击空白处，移除键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(endEdit)];
    [self.view addGestureRecognizer:tap];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyboardWillAppear:)
                                                name:UIKeyboardDidShowNotification
                                              object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyboardWillDisappear:)
                                                name:UIKeyboardWillHideNotification
                                              object:nil];
}



/**
 *  获取键盘高度
 */
-(CGFloat)keyboardEndingFrameHeight:(NSDictionary *)userInfo
{
    CGRect keyboardEndingUncorrectedFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGRect keyboardEndingFrame = [self.view convertRect:keyboardEndingUncorrectedFrame fromView:nil];
    
    return keyboardEndingFrame.size.height;
}

/**
 *  弹出键盘，视图上移
 */
-(void)keyboardWillAppear:(NSNotification *)notification

{
    CGRect currentFrame = self.view.frame;
    CGFloat change = [self keyboardEndingFrameHeight:[notification userInfo]];
    currentFrame.origin.y = currentFrame.origin.y - change ;
    self.view.frame = currentFrame;
    
}

/**
 *  关闭键盘，视图下移
 */
-(void)keyboardWillDisappear:(NSNotification *)notification

{
    CGRect currentFrame = self.view.frame;
    CGFloat change = [self keyboardEndingFrameHeight:[notification userInfo]];
    currentFrame.origin.y = currentFrame.origin.y + change ;
    self.view.frame = currentFrame;
    
}
//
///**
// 点击空白处，移除键盘
// */
-(void)endEdit {
    [self.textView resignFirstResponder];
   
}
@end
