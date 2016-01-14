//
//  WebProtocolViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/13.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "WebProtocolViewController.h"
#import "WebProtocolView.h"

@interface WebProtocolViewController ()<WebProtocolViewDelegate>

@end

@implementation WebProtocolViewController
{
    WebProtocolView *webProtocolView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    webProtocolView = [[WebProtocolView alloc] init];
    webProtocolView.delegate = self;
    self.view = webProtocolView;
    
    self.navigationItem.title = @"网络协议";
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [webProtocolView stopWeb];
}


@end
