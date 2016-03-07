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
#import "UMSocial.h"

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

- (void)actionShare
{
    
    //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56c6c36fe0f55af500001166"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQQ,UMShareToSms,nil]
                                       delegate:nil];
}

@end
