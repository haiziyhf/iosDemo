//
//  TwoViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/24.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingView.h"
#import "AvatarViewController.h"
#import "AddressViewController.h"
#import "MyWalletViewController.h"
#import "SafetyViewController.h"
#import "DemoViewController.h"
#import "GrabOneViewController.h"

@interface SettingViewController ()<SettingViewDelegate>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SettingView *settingView = [[SettingView alloc] init];
    settingView.delegate = self;
    self.view = settingView;
    
    self.navigationItem.title = @"设置";
}

- (void)actionAvator
{
    AvatarViewController *avatarViewController = [[AvatarViewController alloc] init];
    [self.navigationController pushViewController:avatarViewController animated:YES];
}

- (void)actionMyWallet
{
    MyWalletViewController *viewController = [[MyWalletViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)actionAddressList
{
    AddressViewController *addressVeiwController = [[AddressViewController alloc] init];
    [self.navigationController pushViewController:addressVeiwController animated:YES];
}

- (void)actionSafety
{
    SafetyViewController *safetyViewController = [[SafetyViewController alloc] init];
    [self.navigationController pushViewController:safetyViewController animated:YES];
}

- (void)actionDemo
{
    DemoViewController *demoViewController = [[DemoViewController alloc] init];
    [self.navigationController pushViewController:demoViewController animated:YES];
}

- (void)actionGoGradOne
{
    GrabOneViewController *grabOneController = [[GrabOneViewController alloc] init];
    [self.navigationController pushViewController:grabOneController animated:YES];
}

@end
