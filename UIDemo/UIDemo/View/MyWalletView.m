//
//  MyWalletView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/4.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "MyWalletView.h"

@implementation MyWalletView

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    self.tableData = [[NSMutableArray alloc] initWithObjects:
                      @[
                        @{@"id" : @"account", @"type" : @"custom", @"image": @"", @"text" : @"账户余额"},
                        @{@"id" : @"balance", @"type" : @"custom", @"action": @"actionBalanceList", @"image": @"", @"text" : @"收支明细"},
                        ],
                      nil];
    [self.tableView reloadData];
    
    return self;
}

#pragma mark - TableView
- (UITableViewCell *)tableView:(UITableView *)tableView customCellForRowAtIndexPath:(NSIndexPath *)indexPath withCell:(UITableViewCell *)cell
{
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSDictionary *cellData = [self tableView:tableView cellDataForRowAtIndexPath:indexPath];
    
    NSString *id = [cellData objectForKey:@"id"];
    if ([@"account" isEqualToString:id]) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *accountLabel = [[UILabel alloc] init];
        accountLabel.text = @"￥520.00";
        accountLabel.textColor = [UIColor redColor];
        accountLabel.font = [UIFont boldSystemFontOfSize:16.0];
        [cell addSubview:accountLabel];
        
        [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY);
            make.left.equalTo(cell.mas_left).offset(90);
        }];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? HEIGHT_TABLE_MARGIN_DEFAULT : HEIGHT_TABLE_MARGIN_ZERO;
}

- (void)actionBalanceList
{
    [self.delegate actionBalanceList];
}

@end
