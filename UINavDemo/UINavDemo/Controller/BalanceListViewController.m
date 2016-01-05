//
//  BalanceListViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/4.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BalanceListViewController.h"
#import "BalanceListView.h"

@interface BalanceListViewController ()<BalanceListViewDelegate>

@end

@implementation BalanceListViewController
{
    BalanceListView *listView;
    NSMutableArray *accountList;
    
    //当前页数
    int page;
    BOOL hasMore;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    listView = [[BalanceListView alloc] init];
    listView.delegate = self;
    self.view = listView;
    
    accountList = [NSMutableArray array];
    page = 0;
    hasMore = YES;
    
    self.navigationItem.title = @"收支明细";
}

#pragma mark - Public Methods

- (void)loadData:(CallbackBlock)success failure:(CallbackBlock)failure
{
    //分页加载
    page++;
    NSArray *nameArr = @[@"充值",@"消费",@"转入",@"转出"];
    
    for (int i = 1;i<=10;i++) {
        int key = arc4random() % nameArr.count;
        NSDictionary *dataD = @{@"name":nameArr[key],@"value":@(10 * i),@"account":@(5 * i),@"date":@(1451468644 + i * 300)};
        [accountList addObject:dataD];
    }
    
    if (page > 3) {
        hasMore = NO;
    }
    success(nil);
    
}

#pragma mark - Action
- (void)actionLoad:(UITableView *)tableView
{
    //加载数据
    [self loadData:^(id object) {
        [tableView stopRefreshLoading];
        if (!hasMore) {
            [tableView setRefreshLoadingState:RefreshLoadingStateNoMoreData];
        }
        [listView setData:@"accountList" value:accountList];
        [listView renderData];
    } failure:^(id object) {
        [tableView stopRefreshLoading];
    }];
}
@end
