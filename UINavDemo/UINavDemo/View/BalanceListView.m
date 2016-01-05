//
//  BalanceListView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/4.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BalanceListView.h"

@implementation BalanceListView

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    self.tableView.scrollEnabled = YES;
    [self.tableView setLoadingFooter:self action:@selector(actionLoad)];
    [self.tableView startLoading];
    
    return self;
}

- (void)renderData
{
    NSDictionary *dataDic = [self getData:@"accountList"];
    NSMutableArray *data = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in dataDic) {
        [data addObject:@{@"id" : @"balance", @"type" : @"custom", @"action": @"", @"height": @50, @"data": dic}];
    }
    self.tableData = [[NSMutableArray alloc] initWithObjects:data, nil];
    [self.tableView reloadData];
}

#pragma mark - TableView
- (UITableViewCell *)tableView:(UITableView *)tableView customCellForRowAtIndexPath:(NSIndexPath *)indexPath withCell:(UITableViewCell *)cell
{
    NSDictionary *cellData = [self tableView:tableView cellDataForRowAtIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    NSDictionary *data = [cellData objectForKey:@"data"];
    
    //收入或支出
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = data[@"name"];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:16.0];
    [cell addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.mas_top).offset(5);
        make.left.equalTo(cell.mas_left).offset(10);
    }];
    
    //消费金额
    UILabel *accountLabel = [[UILabel alloc] init];
    accountLabel.text = [NSString stringWithFormat:@"￥%.2f",[data[@"value"] floatValue]];
    accountLabel.textColor = [UIColor grayColor];
    accountLabel.font = [UIFont systemFontOfSize:16.0];
    [cell addSubview:accountLabel];
    
    [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.mas_top).offset(5);
        make.right.equalTo(cell.mas_right).offset(-10);
    }];
    
    //账户余额
    UILabel *balanceLabel = [[UILabel alloc] init];
    balanceLabel.text= [NSString stringWithFormat:@"余额：￥%.2f",[data[@"account"] floatValue]];
    balanceLabel.textColor = [UIColor blackColor];
    balanceLabel.font = [UIFont systemFontOfSize:16.0];
    [cell addSubview:balanceLabel];
    
    [balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.mas_left).offset(10);
        make.bottom.equalTo(cell.mas_bottom).offset(-5);
    }];
    
    //消费时间
    NSDate *now = [NSDate dateWithTimeIntervalSince1970:[data[@"date"] intValue]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    dateFormat.dateFormat = @"yyyy-MM-dd hh:mm";
    NSString *dateStr = [dateFormat stringFromDate:now];
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = dateStr;
    timeLabel.textColor = [UIColor grayColor];
    timeLabel.font = [UIFont systemFontOfSize:16.0];
    [cell addSubview:timeLabel];
    
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(cell.mas_bottom).offset(-5);
        make.right.equalTo(cell.mas_right).offset(-10);
    }];
    
    return cell;
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? HEIGHT_TABLE_MARGIN_DEFAULT : HEIGHT_TABLE_MARGIN_ZERO;
}
 */

#pragma mark - Action
- (void)actionLoad
{
    [self.delegate actionLoad:self.tableView];
}
@end
