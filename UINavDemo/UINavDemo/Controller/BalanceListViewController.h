//
//  BalanceListViewController.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/4.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BalanceListViewController : UIViewController

//控制器回调函数
typedef void (^CallbackBlock)(id object);

//加载数据，完成后执行回调
- (void) loadData: (CallbackBlock) success failure: (CallbackBlock) failure;

@end
