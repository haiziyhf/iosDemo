//
//  SafetyViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/5.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "SafetyViewController.h"
#import "SafetyView.h"
#import "UpdatePasswordViewController.h"

@interface SafetyViewController ()<SafetyViewDelegate>

@end

@implementation SafetyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SafetyView *safetyView = [[SafetyView alloc] init];
    safetyView.delegate = self;
    self.view = safetyView;
    
    self.navigationItem.title = @"账户与安全";
    
}

- (void)actionUpdatePassword
{
    UpdatePasswordViewController *viewController = [UpdatePasswordViewController alloc];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
