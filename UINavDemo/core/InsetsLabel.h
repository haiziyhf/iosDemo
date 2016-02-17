//
//  InsetsLabel.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/2/15.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsetsLabel : UILabel

@property(nonatomic) UIEdgeInsets insets;

- (id)initWithFrame:(CGRect)frame andInsets: (UIEdgeInsets) insets;

- (id)initWithInsets: (UIEdgeInsets) insets;

@end
