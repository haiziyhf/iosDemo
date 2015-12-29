//
//  NavViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/24.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "NavViewController.h"
#import "MenuViewController.h"
#import "UIViewController+REFrostedViewController.h"

@interface NavViewController ()

@property (strong, readwrite, nonatomic) MenuViewController *menuViewController;

@end

@implementation NavViewController
{
    BOOL menuEnabled;
    UIPanGestureRecognizer *recognizer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuEnabled = NO;
        
    [self.navigationController.navigationItem.backBarButtonItem setBackButtonTitlePositionAdjustment:UIOffsetMake(-400.f, 0) forBarMetrics:UIBarMetricsDefault];
    
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
}

- (void)showMenu
{
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    [self.frostedViewController presentMenuViewController];
}

- (void)menuEnable:(BOOL)enable
{
    menuEnabled = enable;
}

- (void)menuGestured:(BOOL)gestured
{
    recognizer.enabled = NO;
}

/* 定义向右滑动是否出现菜单 */
- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    if (menuEnabled) {
        [self.view endEditing:YES];
        [self.frostedViewController.view endEditing:YES];

        [self.frostedViewController panGestureRecognized:sender];
    }
}




@end
