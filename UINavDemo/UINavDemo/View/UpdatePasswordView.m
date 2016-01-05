//
//  UpdatePasswordView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/5.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "UpdatePasswordView.h"
#import "DLRadioButton.h"

@implementation UpdatePasswordView

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    UIView *superView = self;
    int padding = 10;
    self.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    
    UITextField *passwordField = [self textField];
    passwordField.placeholder = @"请输入密码";
    passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:passwordField];
    
    [passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.height.equalTo(@40);
    }];
    
    UITextField *rePasswordField = [self textField];
    rePasswordField.placeholder = @"请输入密码";
    rePasswordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:rePasswordField];
    
    [rePasswordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordField.mas_bottom).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.height.equalTo(@40);
    }];

    
    return self;
}

- (UITextField *)textField
{
    UITextField *textField = [[UITextField alloc] init];
    textField.layer.borderWidth = 0.5f;
    textField.layer.borderColor = [UIColor colorWithHexString:@"dddddd"].CGColor;
    textField.layer.cornerRadius = 3.0f;
    textField.backgroundColor = [UIColor whiteColor];
    textField.font = [UIFont systemFontOfSize:16.0];
    
    CGRect frame = [textField frame];
    frame.size.width = 7.0f;
    UIView *leftView = [[UIView alloc] initWithFrame:frame];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftView;
    return textField;
}

@end
