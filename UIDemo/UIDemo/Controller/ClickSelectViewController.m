//
//  ClickSelectViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/19.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "ClickSelectViewController.h"
#import "ClickSelectView.h"

@interface ClickSelectViewController ()<ClickSelectViewDelegate>

@end

@implementation ClickSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ClickSelectView *clickView = [[ClickSelectView alloc] init];
    clickView.delegate = self;
    self.view = clickView;
    
    self.navigationItem.title = @"点击选择";
}

@end
