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
{
    UITextField *passwordField;
    UITextField *rePasswordField;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    UIView *superView = self;
    int padding = 10;
    self.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    
    passwordField = [self textField];
    passwordField.placeholder = @"请输入密码";
    passwordField.secureTextEntry = YES;
    passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:passwordField];
    
    [passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.height.equalTo(@40);
    }];
    
    rePasswordField = [self textField];
    rePasswordField.placeholder = @"请输入密码";
    rePasswordField.secureTextEntry = YES;
    rePasswordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:rePasswordField];
    
    [rePasswordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passwordField.mas_bottom).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        make.height.equalTo(@40);
    }];

    DLRadioButton *radioBtn = [[DLRadioButton alloc] init];
    radioBtn.iconSquare = YES;
    radioBtn.iconSize = 16.0f;
    radioBtn.iconColor = [UIColor redColor];
    radioBtn.indicatorColor = [UIColor redColor];
    radioBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    radioBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [radioBtn addTarget:self action:@selector(actionSelRadio:) forControlEvents:UIControlEventTouchUpInside];
    [radioBtn setTitle:@"显示密码" forState:UIControlStateNormal];
    [radioBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:radioBtn];
    
    [radioBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rePasswordField.mas_bottom).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.width.equalTo(@120);
        make.height.equalTo(@20);
    }];
    
    
    DLRadioButton *firstRadio = [[DLRadioButton alloc] init];
    firstRadio.iconSize = 12;
    firstRadio.titleLabel.font = [UIFont systemFontOfSize:16.0];
    firstRadio.iconColor = [UIColor purpleColor];
    firstRadio.indicatorColor = [UIColor purpleColor];
    firstRadio.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [firstRadio setTitle:@"粉色" forState:UIControlStateNormal];
    [firstRadio setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self addSubview:firstRadio];
    
    [firstRadio mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(radioBtn.mas_bottom).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.width.equalTo(@120);
        make.height.equalTo(@20);
    }];
    
    UIView *borderView = [[UIView alloc] init];
    borderView = firstRadio;
    
    NSDictionary *radioColor = @{@"red":[UIColor redColor],@"green":[UIColor greenColor],@"blue":[UIColor blueColor]};
    NSDictionary *radioName = @{@"red":@"红色",@"green":@"绿色",@"blue":@"蓝色"};
    
    NSMutableArray *radioArr = [NSMutableArray new];
    
    for (NSDictionary *color in radioColor) {
        DLRadioButton *radio = [[DLRadioButton alloc] init];
        radio.iconSize = 12;
        radio.titleLabel.font = [UIFont systemFontOfSize:16.0];
        radio.iconColor = [radioColor objectForKey:color];
        radio.indicatorColor = [radioColor objectForKey:color];
        radio.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [radio setTitle:[radioName objectForKey:color] forState:UIControlStateNormal];
        [radio setTitleColor:[radioColor objectForKey:color] forState:UIControlStateNormal];
        [self addSubview:radio];
        
        [radio mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(borderView.mas_bottom).offset(padding);
            make.left.equalTo(superView.mas_left).offset(padding);
            make.width.equalTo(@120);
            make.height.equalTo(@20);
        }];
        borderView = radio;
        [radioArr addObject:radio];
    }
    firstRadio.otherButtons = radioArr;
    
    //复选框
    NSInteger i = 1;
    DLRadioButton *chkBtn = [[DLRadioButton alloc] init];
    chkBtn.multipleSelectionEnabled = YES;
    chkBtn.tag = i;
    chkBtn.iconSize = 12;
    chkBtn.iconSquare = YES;
    chkBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    chkBtn.iconColor = [UIColor darkGrayColor];
    chkBtn.indicatorColor = [UIColor darkGrayColor];
    chkBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [chkBtn addTarget:self action:@selector(actionRadio:) forControlEvents:UIControlEventTouchUpInside];
    [chkBtn setTitle:@"浅黑" forState:UIControlStateNormal];
    [chkBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self addSubview:chkBtn];
    
    [chkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(borderView.mas_bottom).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.width.equalTo(@120);
        make.height.equalTo(@20);
    }];
    
    borderView = chkBtn;
    
    NSMutableArray *otherButton = [NSMutableArray new];
    for (NSDictionary *color in radioColor) {
        i++;
        DLRadioButton *chkBtnOther = [[DLRadioButton alloc] init];
        chkBtnOther.multipleSelectionEnabled = YES;
        chkBtnOther.tag = i;
        chkBtnOther.iconSize = 12;
        chkBtnOther.iconSquare = YES;
        chkBtnOther.titleLabel.font = [UIFont systemFontOfSize:16.0];
        chkBtnOther.iconColor = [radioColor objectForKey:color];
        chkBtnOther.indicatorColor = [radioColor objectForKey:color];
        chkBtnOther.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [chkBtnOther addTarget:self action:@selector(actionRadio:) forControlEvents:UIControlEventTouchUpInside];
        [chkBtnOther setTitle:[radioName objectForKey:color] forState:UIControlStateNormal];
        [chkBtnOther setTitleColor:[radioColor objectForKey:color] forState:UIControlStateNormal];
        [self addSubview:chkBtnOther];
        
        [chkBtnOther mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(borderView.mas_bottom).offset(padding);
            make.left.equalTo(superView.mas_left).offset(padding);
            make.width.equalTo(@120);
            make.height.equalTo(@20);
        }];
        [otherButton addObject:chkBtnOther];
        borderView = chkBtnOther;

    }
    chkBtn.otherButtons = otherButton;
    
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

- (void)actionSelRadio:(DLRadioButton *)radio
{
    if (passwordField.secureTextEntry == NO) {
        radio.selected = NO;
        passwordField.secureTextEntry = YES;
        rePasswordField.secureTextEntry = YES;
    } else {
        radio.selected = YES;
        passwordField.secureTextEntry = NO;
        rePasswordField.secureTextEntry = NO;
    }
}

- (void)actionRadio:(DLRadioButton *)radio
{
    if (radio.isMultipleSelectionEnabled) {
        for (DLRadioButton *rd in radio.selectedButtons) {
            NSLog(@"多选的值为：%ld",rd.tag);
        }
    }
}

@end
