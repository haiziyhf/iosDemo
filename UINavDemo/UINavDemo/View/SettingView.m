//
//  SettingView.m
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/28.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "SettingView.h"

@implementation SettingView
{
    UILabel *nameLabel;
    UIImageView *avatarImage;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    self.tableData = [[NSMutableArray alloc] initWithObjects:
                      @[
                        @{@"id" : @"avatar", @"type" : @"custom", @"action": @"actionAvator", @"image": @"", @"text" : @"", @"height" : @60},
                        ],
                      @[
                        @{@"id" : @"wallet", @"type" : @"action", @"action": @"actionMyWallet", @"image": @"", @"text" : @"我的钱包"},
                        ],
                      @[
                        @{@"id" : @"address", @"type" : @"action", @"action": @"actionAddressList", @"image": @"", @"text" : @"我的地址"},
                        @{@"id" : @"safety", @"type" : @"action", @"action": @"actionSafety", @"image": @"", @"text" : @"账户与安全"},
                        ],
                      nil];
    [self.tableView reloadData];
    
    return self;
}

#pragma mark - TableView
- (UITableViewCell *)tableView:(UITableView *)tableView customCellForRowAtIndexPath:(NSIndexPath *)indexPath withCell:(UITableViewCell *)cell
{
    NSDictionary *cellData = [self tableView:tableView cellDataForRowAtIndexPath:indexPath];
    
    NSString *id = [cellData objectForKey:@"id"];
    if ([@"avatar" isEqualToString:id]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        //初始化图片
        avatarImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nopic.png"]];
        avatarImage.layer.cornerRadius = 20.0f;
        avatarImage.clipsToBounds = YES;
        [cell addSubview:avatarImage];
        
        [avatarImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY);
            make.left.equalTo(cell.mas_left).offset(10);
            make.height.equalTo(@40);
            make.width.equalTo(@40);
        }];
        
        
        nameLabel = [[UILabel alloc] init];
        nameLabel.text = @"杨杨海子";
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.font = [UIFont systemFontOfSize:16.0];
        [cell addSubview:nameLabel];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY);
            make.left.equalTo(avatarImage.mas_right).offset(10);
        }];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? HEIGHT_TABLE_MARGIN_DEFAULT : HEIGHT_TABLE_MARGIN_ZERO;
}

#pragma mark - Action

- (void)actionAvator
{
    [self.delegate actionAvator];
}

@end
