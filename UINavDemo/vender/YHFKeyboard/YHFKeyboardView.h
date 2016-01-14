//
//  YHFKeyboardView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/14.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YHFKeyboardViewDelegate <NSObject>


@end

@interface YHFKeyboardView : UIView

- (void)makeField:(UITextField *)field;

@end
