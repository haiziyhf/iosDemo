//
//  SettingView.h
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/28.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "BaseTableView.h"

@protocol SettingViewDelegate <NSObject>

- (void)actionAvator;

@end

@interface SettingView : BaseTableView

@property (retain, nonatomic) id<SettingViewDelegate>delegate;

@end
