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
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 50, 80, 100, 30);
    button.layer.borderWidth = 0.5f;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.cornerRadius = 3.0f;
    
    button.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [button addTarget:self action:@selector(actionPush) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"下一个" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    self.navigationItem.title = @"主页面";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)actionPush
{
    SettingViewController *viewController = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
