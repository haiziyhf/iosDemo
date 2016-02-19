//
//  ViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/24.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "HomeViewController.h"
#import "NavViewController.h"
#import "SettingViewController.h"
#import "WebProtocolViewController.h"
#import "WaterfallsFlowViewController.h"
#import "ClickSelectViewController.h"
#import "PageViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor redColor]];
    
    //菜单按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"]
                                                                             style:UIBarButtonItemStyleDone
                                                                            target:(NavViewController *)self.navigationController
                                                                            action:@selector(showMenu)];
    
    
    
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, 20, 100, 30);
    button.layer.borderWidth = 0.5f;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.cornerRadius = 3.0f;
    
    button.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [button addTarget:self action:@selector(actionPush) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"下一个" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    UIButton *webButton = [[UIButton alloc] init];
    webButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, 70, 100, 30);
    webButton.layer.borderWidth = 0.5f;
    webButton.layer.borderColor = [UIColor redColor].CGColor;
    webButton.layer.cornerRadius = 3.0f;
    
    webButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [webButton addTarget:self action:@selector(actionWebProtocol) forControlEvents:UIControlEventTouchUpInside];
    [webButton setTitle:@"网络协议" forState:UIControlStateNormal];
    [webButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:webButton];
    
    UIButton *waterButton = [[UIButton alloc] init];
    waterButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, 120, 100, 30);
    waterButton.layer.borderWidth = 0.5f;
    waterButton.layer.borderColor = [UIColor redColor].CGColor;
    waterButton.layer.cornerRadius = 3.0f;
    
    waterButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [waterButton addTarget:self action:@selector(actionWaterfallsFlow) forControlEvents:UIControlEventTouchUpInside];
    [waterButton setTitle:@"瀑布流" forState:UIControlStateNormal];
    [waterButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:waterButton];
    
    
    UIButton *clickButton = [[UIButton alloc] init];
    clickButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, 170, 100, 30);
    clickButton.layer.borderWidth = 0.5f;
    clickButton.layer.borderColor = [UIColor redColor].CGColor;
    clickButton.layer.cornerRadius = 3.0f;
    
    clickButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [clickButton addTarget:self action:@selector(actionClickSelect) forControlEvents:UIControlEventTouchUpInside];
    [clickButton setTitle:@"点击选择" forState:UIControlStateNormal];
    [clickButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:clickButton];
    
    UIButton *pageButton = [[UIButton alloc] init];
    pageButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, 220, 100, 30);
    pageButton.layer.borderWidth = 0.5f;
    pageButton.layer.borderColor = [UIColor redColor].CGColor;
    pageButton.layer.cornerRadius = 3.0f;
    
    pageButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [pageButton addTarget:self action:@selector(actionPageControl) forControlEvents:UIControlEventTouchUpInside];
    [pageButton setTitle:@"循环展示" forState:UIControlStateNormal];
    [pageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:pageButton];

    
    self.navigationItem.title = @"主页面";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)actionPush
{
    SettingViewController *viewController = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)actionWebProtocol
{
    WebProtocolViewController *viewController = [[WebProtocolViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)actionWaterfallsFlow
{
    WaterfallsFlowViewController *viewController = [[WaterfallsFlowViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)actionClickSelect
{
    ClickSelectViewController *viewController = [[ClickSelectViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)actionPageControl
{
    PageViewController *viewController = [[PageViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
