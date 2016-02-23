//
//  GrabOneView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/29.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseView.h"

@protocol PopupVieweDelegate <NSObject>

- (void)actionPopupClose;

@end

@interface PopupView : BaseView

@property (retain, nonatomic) id<PopupVieweDelegate>delegate;

@end
