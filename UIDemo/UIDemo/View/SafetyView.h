//
//  SafetyView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/4.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseTableView.h"

@protocol SafetyViewDelegate <NSObject>

- (void)actionUpdatePassword;

@end

@interface SafetyView : BaseTableView

@property (retain, nonatomic) id<SafetyViewDelegate>delegate;

@end
