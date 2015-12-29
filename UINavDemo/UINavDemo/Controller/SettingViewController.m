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
@end
