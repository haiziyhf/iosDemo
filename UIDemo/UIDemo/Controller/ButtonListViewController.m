//
//  ButtonListViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/7.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "ButtonListViewController.h"
#import "ButtonListView.h"

@interface ButtonListViewController ()<ButtonListViewDelegate>

@end

@implementation ButtonListViewController
{
    ButtonListView *listView;
    UIButton *currentButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //解决导航栏覆盖view
    if (IS_IOS7_PLUS) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }

    listView = [[ButtonListView alloc] init];
    listView.delegate = self;
    self.view = listView;
    
    currentButton = listView.defaultButton;
    
    self.navigationItem.title = @"按钮列表";
    
}

- (void)actionToggleBtn:(UIButton *)button
{
    [currentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    currentButton.backgroundColor = [UIColor clearColor];

    NSLog(@"当前选择的是：%ld",button.tag);
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    currentButton = button;
}
@end
