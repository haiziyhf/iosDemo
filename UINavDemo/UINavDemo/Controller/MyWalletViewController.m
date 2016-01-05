//
//  MyWalletViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/4.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "MyWalletViewController.h"
#import "MyWalletView.h"
#import "BalanceListViewController.h"

@interface MyWalletViewController ()<MyWalletViewDelegate>

@end

@implementation MyWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MyWalletView *viewController = [[MyWalletView alloc] init];
    viewController.delegate = self;
    self.view = viewController;
    
    self.navigationItem.title = @"我的账户";
}

- (void)actionBalanceList
{
    BalanceListViewController *viewController = [[BalanceListViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
