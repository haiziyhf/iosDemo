//
//  AvatarView.m
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/28.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "AvatarView.h"

@implementation AvatarView
{
    UIImageView *avatarImage;
    UILabel *nameLabel;
    UILabel *sexLabel;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    self.tableData = [[NSMutableArray alloc] initWithObjects:
                      @[
                        @{@"id" : @"avatar", @"type" : @"custom", @"action": @"actionAvatar", @"image": @"", @"text" : @"头像"},
                        @{@"id" : @"nickname", @"type" : @"custom", @"action": @"actionNickname", @"image": @"", @"text" : @"昵称"},
                        @{@"id" : @"sex", @"type" : @"custom", @"action": @"actionSex", @"image": @"", @"text" : @"性别"},
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
    if ([@"avatar" isEqualToString:id]) {
        
        //初始化图片
        avatarImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nopic.png"]];
        avatarImage.layer.cornerRadius = 20.0f;
        avatarImage.clipsToBounds = YES;
        [cell addSubview:avatarImage];
        
        [avatarImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY);
            make.right.equalTo(cell.mas_right).offset(-30);
            make.height.equalTo(@40);
            make.width.equalTo(@40);
        }];
    } else if ([@"nickname" isEqualToString:id]) {
        nameLabel = [[UILabel alloc] init];
        nameLabel.text = @"杨杨海子";
        nameLabel.textColor = [UIColor grayColor];
        nameLabel.font = [UIFont systemFontOfSize:16.0];
        [cell addSubview:nameLabel];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY);
            make.right.equalTo(cell.mas_right).offset(-30);
        }];
    } else if ([@"sex" isEqualToString:id]) {
        sexLabel = [[UILabel alloc] init];
        sexLabel.text = @"男";
        sexLabel.textColor = [UIColor grayColor];
        sexLabel.font = [UIFont systemFontOfSize:16.0];
        [cell addSubview:sexLabel];
        
        [sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.mas_centerY);
            make.right.equalTo(cell.mas_right).offset(-30);
        }];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? HEIGHT_TABLE_MARGIN_DEFAULT : HEIGHT_TABLE_MARGIN_ZERO;
}

- (void)actionAvatar
{
    [self.delegate actionAvatar];
}

- (void)actionNickname
{
    [self.delegate actionNickname];
}

- (void)actionSex
{
    [self.delegate actionSex];
}

@end
