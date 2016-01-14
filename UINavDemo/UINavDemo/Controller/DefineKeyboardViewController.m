//
//  DefineKeyboardViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/14.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "DefineKeyboardViewController.h"
#import "DefineKayboradView.h"

@interface DefineKeyboardViewController ()<DefineKeyboardViewDelegate>

@end

@implementation DefineKeyboardViewController
{
    DefineKayboradView *keyboardView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    keyboardView = [[DefineKayboradView alloc] init];
    keyboardView.delegate = self;
    self.view = keyboardView;
    
    self.navigationItem.title = @"自定义键盘";
    
}

@end
