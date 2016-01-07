//
//  ButtonListView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/7.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "ButtonListView.h"

@implementation ButtonListView

@synthesize defaultButton;

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    self.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    UIView *superView = self;
    
    UIView *btnView = [[UIView alloc] init];
    btnView.backgroundColor = [UIColor whiteColor];
    [self addSubview:btnView];

    [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top);
        make.left.equalTo(superView.mas_left);
        make.right.equalTo(superView.mas_right);
        make.height.equalTo(@30);
    }];
    
    NSArray *listBtn = @[
                         @{@"name":@"待接单",@"tag":@1,@"status":@"new"},
                         @{@"name":@"已接单",@"tag":@2,@"status":@"locked"},
                         @{@"name":@"服务中",@"tag":@3,@"status":@"confirmed"},
                         @{@"name":@"服务完成",@"tag":@4,@"status":@"payed"},
                         @{@"name":@"已结束",@"tag":@5,@"status":@"finished"},
                         ];
    
    CGFloat leftMargin = 0.0;
    int i = 1;
    
    for (NSDictionary *buttonDic in listBtn) {
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor whiteColor];
        button.titleLabel.font = [UIFont systemFontOfSize:16.0];
        NSNumber *tag = [buttonDic objectForKey:@"tag"];
        button.tag = [tag integerValue];
        [button addTarget:self action:@selector(actionToggleBtn:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:[buttonDic objectForKey:@"name"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnView addSubview:button];
        
        CGFloat width = SCREEN_WIDTH / [listBtn count];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btnView.mas_top);
            make.bottom.equalTo(btnView.mas_bottom);
            make.left.equalTo(btnView.mas_left).offset(leftMargin);
            make.width.equalTo(@(width));
        }];
        leftMargin += width;
        
        //设置默认按钮
        if (i == 1) {
            defaultButton = button;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.backgroundColor = [UIColor blackColor];
        }
        i++;
    }
    
    return self;
}

- (void)actionToggleBtn:(UIButton *)sender
{
    [self.delegate actionToggleBtn:sender];
}

@end
