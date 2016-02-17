//
//  GrabOneView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/29.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "GrabOneView.h"

@implementation GrabOneView

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    UIView *superView = self;
    
    UIButton *grabButton = [[UIButton alloc] init];
    grabButton.backgroundColor = [UIColor colorWithHexString:@"0199FF"];
    grabButton.layer.cornerRadius = 50.0f;
    grabButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [grabButton addTarget:self action:@selector(actionShowPopup) forControlEvents:UIControlEventTouchUpInside];
    [grabButton setTitle:@"抢单" forState:UIControlStateNormal];
    [grabButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:grabButton];
    
    [grabButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(superView);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    return self;
}

- (void)actionShowPopup
{
    [self.delegate actionShowPopup];
}

@end
