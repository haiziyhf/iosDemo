//
//  DemoViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/28.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "DemoViewController.h"
#import "DemoView.h"

@interface DemoViewController ()<DemoViewDelegate>

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DemoView *demoView = [[DemoView alloc] init];
    demoView.delegate = self;
    self.view = demoView;
    
    self.navigationItem.title = @"实例Demo";
    
    
}

@end
