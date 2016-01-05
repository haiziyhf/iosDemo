//
//  MyWalletView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/4.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseTableView.h"

@protocol MyWalletViewDelegate <NSObject>

- (void)actionBalanceList;

@end

@interface MyWalletView : BaseTableView

@property (retain, nonatomic) id<MyWalletViewDelegate>delegate;

@end
