//
//  AppDelegate.m
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/24.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "AppDelegate.h"
#import "NavViewController.h"
#import "HomeViewController.h"
#import "MenuViewController.h"
#import "MZGuidePages.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "UMSocialQQHandler.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-400.0f, 0)
     
                                                         forBarMetrics:UIBarMetricsDefault];
    
    HomeViewController *viewController = [[HomeViewController alloc] init];
    
    NavViewController *navController = [[NavViewController alloc] initWithRootViewController:viewController];
    
    MenuViewController *menuController = [[MenuViewController alloc] initWithStyle:UITableViewStylePlain];
    
    // Create frosted view controller
    REFrostedViewController *frostedViewController = [[REFrostedViewController alloc] initWithContentViewController:navController menuViewController:menuController];
    frostedViewController.direction = REFrostedViewControllerDirectionLeft;
    frostedViewController.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleLight;
    frostedViewController.liveBlur = YES;
    frostedViewController.delegate = self;
    
    //Make it a root controller
    self.window.rootViewController = frostedViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //只运行一次
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *launched = [userDefaults objectForKey:@"launched"];
    if (!launched)
    {
        [self guidePages];
        launched = @"YES";
        [userDefaults setObject:launched forKey:@"launched"];
        [userDefaults synchronize];
    }
    
    //一直运行
    //[self guidePages];
    
    //初始化友盟分享
    [self initUMeng];
    
    return YES;
}

//初始化友盟社会组件
- (void)initUMeng
{
    //设置友盟社会化组件appkey
    [UMSocialData setAppKey:@"56c6c36fe0f55af500001166"];
    
    
     //设置微信AppId、appSecret，分享url
     [UMSocialWechatHandler setWXAppId:@"wx13027d38d8233000" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://user.qzone.qq.com/775317846/infocenter"];
    
     //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。
     [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"1411372117"
     secret:@"04b48b094faeb16683c32669824ebdad"
     RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
     [UMSocialQQHandler setQQWithAppId:@"1105115627" appKey:@"wtMZqqD5SN4CaZy9" url:@"http://user.qzone.qq.com/775317846/infocenter"];
     [UMSocialQQHandler setSupportWebView:YES];
     /*
     //隐藏没有安装的平台
     [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQQ,UMShareToQzone,UMShareToSina]];
     */
    
}

/**
 这里处理新浪微博SSO授权之后跳转回来，和微信分享完成之后跳转回来
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url wxApiDelegate:nil];
}

- (void)guidePages
{
    //数据源
    NSArray *imageArray = @[ @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg" ];
    
    //  初始化方法1
    MZGuidePages *mzgpc = [[MZGuidePages alloc] init];
    mzgpc.imageDatas = imageArray;
    __weak typeof(MZGuidePages) *weakMZ = mzgpc;
    mzgpc.buttonAction = ^{
        [UIView animateWithDuration:2.0f
                         animations:^{
                             weakMZ.alpha = 0.0;
                         }
                         completion:^(BOOL finished) {
                             [weakMZ removeFromSuperview];
                         }];
    };
    
    //  初始化方法2
    //    MZGuidePagesController *mzgpc = [[MZGuidePagesController alloc]
    //    initWithImageDatas:imageArray
    //                                                                            completion:^{
    //                                                                              NSLog(@"click!");
    //
    
    //要在makeKeyAndVisible之后调用才有效
    [self.window addSubview:mzgpc];
}


@end
