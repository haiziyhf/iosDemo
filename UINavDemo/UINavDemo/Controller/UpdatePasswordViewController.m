//
//  UpdatePasswordViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/5.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "UpdatePasswordViewController.h"
#import "UpdatePasswordView.h"

@interface UpdatePasswordViewController ()<UpdatePasswordDelegate>

@end

@implementation UpdatePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UpdatePasswordView *updatePasswordView = [[UpdatePasswordView alloc] init];
    updatePasswordView.delegate = self;
    self.view = updatePasswordView;
    
    self.navigationItem.title = @"修改密码";
    
}


@end
