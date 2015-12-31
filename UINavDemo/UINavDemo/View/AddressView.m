//
//  AddressView.m
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/31.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "AddressView.h"

@implementation AddressView


-(id)init
{
    self = [super init];
    if (!self) return nil;
    
    UIView *superView = self;
    
    UIButton *button = [[UIButton alloc] init];
    button.layer.borderWidth = 0.5f;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.cornerRadius = 3.0f;
    button.backgroundColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(showAddressList) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"显示联动" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).offset(120);
        make.centerX.equalTo(superView.mas_centerX);
        make.width.equalTo(@120);
        make.height.equalTo(@30);
    }];
    
    UIButton *twoButton = [[UIButton alloc] init];
    twoButton.layer.borderWidth = 0.5f;
    twoButton.layer.borderColor = [UIColor grayColor].CGColor;
    twoButton.layer.cornerRadius = 3.0f;
    twoButton.backgroundColor = [UIColor whiteColor];
    [twoButton addTarget:self action:@selector(showTwoPick) forControlEvents:UIControlEventTouchUpInside];
    [twoButton setTitle:@"二级联动" forState:UIControlStateNormal];
    [twoButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addSubview:twoButton];
    
    [twoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.mas_bottom).offset(20);
        make.centerX.equalTo(superView.mas_centerX);
        make.width.equalTo(@120);
        make.height.equalTo(@30);
    }];

    UIButton *threeButton = [[UIButton alloc] init];
    threeButton.layer.borderWidth = 0.5f;
    threeButton.layer.borderColor = [UIColor grayColor].CGColor;
    threeButton.layer.cornerRadius = 3.0f;
    threeButton.backgroundColor = [UIColor whiteColor];
    [threeButton addTarget:self action:@selector(showThreePick) forControlEvents:UIControlEventTouchUpInside];
    [threeButton setTitle:@"三级联动" forState:UIControlStateNormal];
    [threeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addSubview:threeButton];
    
    [threeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(twoButton.mas_bottom).offset(20);
        make.centerX.equalTo(superView.mas_centerX);
        make.width.equalTo(@120);
        make.height.equalTo(@30);
    }];
    
    return self;
}

- (void)showAddressList
{
    [self.delegate showAddressList];
}

- (void)showTwoPick
{
    [self.delegate showTwoPick];
}

- (void)showThreePick
{
    [self.delegate showThreePick];
}

@end
