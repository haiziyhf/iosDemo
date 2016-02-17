//
//  GrabOneView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/29.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "PopupView.h"
#import "CNPPopupController.h"
#import "InsetsLabel.h"

@interface PopupView ()<CNPPopupControllerDelegate>

@end

@implementation PopupView

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    UIView *superView = self;
    
    self.backgroundColor = [UIColor colorWithHexString:@"000000" alpha:0.1];
    
    UIView *boxView = [UIView new];
    boxView.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    [self addSubview:boxView];
    
    [boxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    InsetsLabel *titleLabel = [[InsetsLabel alloc] init];
    titleLabel.text = @"您身边有一位客户已发布需求！赶紧下手抢单。";
    titleLabel.textColor = [UIColor colorWithHexString:@"0199FF"];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel setInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
    [boxView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(boxView.mas_top);
        make.left.equalTo(boxView.mas_left);
        make.right.equalTo(boxView.mas_right);
        
        make.height.equalTo(@30);
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = [UIColor clearColor];
    [boxView addSubview:bottomView];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(boxView.mas_left);
        make.bottom.equalTo(boxView.mas_bottom);
        make.right.equalTo(boxView.mas_right);
        
        make.height.equalTo(@120);
    }];
    
    UIButton *grabButton = [[UIButton alloc] init];
    grabButton.backgroundColor = [UIColor colorWithHexString:@"0199FF"];
    grabButton.layer.cornerRadius = 50.0f;
    grabButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [grabButton addTarget:self action:@selector(actionGrabOne) forControlEvents:UIControlEventTouchUpInside];
    [grabButton setTitle:@"抢单" forState:UIControlStateNormal];
    [grabButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomView addSubview:grabButton];
    
    [grabButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(bottomView);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    UIButton *closeButton = [[UIButton alloc] init];
    closeButton.backgroundColor = [UIColor whiteColor];
    closeButton.layer.cornerRadius = 25.0f;
    closeButton.layer.borderWidth = 0.5f;
    closeButton.layer.borderColor = [UIColor grayColor].CGColor;
    closeButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [closeButton addTarget:self action:@selector(actionCloseBtn) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bottomView addSubview:closeButton];
    
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bottomView.mas_centerY);
        make.left.equalTo(grabButton.mas_right).offset(20);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    return self;
}

- (void)actionGrabOne
{

}

- (void)actionCloseBtn
{
    [self.delegate actionPopupClose];
}

@end
