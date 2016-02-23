//
//  BalanceListView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/4.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseTableView.h"
#import "UIScrollView+RefreshLoading.h"

@protocol BalanceListViewDelegate <NSObject>

- (void)actionLoad:(UITableView *)tableView;

@end

@interface BalanceListView : BaseTableView

@property (retain, nonatomic) id<BalanceListViewDelegate>delegate;

@end
