//
//  DefineKayboradView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/14.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "DefineKayboradView.h"
#import "YHFKeyboardView.h"

@implementation DefineKayboradView
{
    UITextField *defineField;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    self.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    UIView *superView = self;
    int padding = 10;
    
    defineField = [[UITextField alloc] init];
    defineField.layer.borderWidth = 0.5f;
    defineField.layer.borderColor = [UIColor grayColor].CGColor;
    defineField.layer.cornerRadius = 3.0f;
    defineField.backgroundColor = [UIColor whiteColor];
    CGRect frame = [defineField frame];
    frame.size.width = 7.0f;
    UIView *leftView = [[UIView alloc] initWithFrame:frame];
    defineField.leftViewMode = UITextFieldViewModeAlways;
    defineField.leftView = leftView;
    
    [self addSubview:defineField];
    
    [defineField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        
        make.height.equalTo(@30);
    }];
    
    CGRect viewFrame = CGRectMake(0, 0, 320, 216);
    YHFKeyboardView *keyboardView = [[YHFKeyboardView alloc] initWithFrame:viewFrame];
    [keyboardView makeField:defineField];
    
    return self;
}

@end
