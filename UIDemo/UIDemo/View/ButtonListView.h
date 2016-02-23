//
//  ButtonListView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/7.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseView.h"

@protocol ButtonListViewDelegate <NSObject>

- (void)actionToggleBtn:(UIButton *)button;

@end

@interface ButtonListView : BaseView

@property (retain, nonatomic) id<ButtonListViewDelegate>delegate;

@property (retain, nonatomic) UIButton *defaultButton;

@end
