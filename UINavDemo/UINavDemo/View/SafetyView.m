//
//  SafetyView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/4.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "SafetyView.h"

@implementation SafetyView


- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    NSMutableString *mobile = [[NSMutableString alloc] initWithString:@"15923220707"];
    [mobile replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    
    self.tableData = [[NSMutableArray alloc] initWithObjects:
                      @[
                        @{@"id" : @"mobile",@"type" : @"custom",@"style" : @"value1",@"text" : @"手机号码",@"detail" : mobile},
                        ],
                      @[
                        @{@"id" : @"password",@"type" : @"action",@"action" : @"actionUpdatePassword",@"text" : @"修改密码"},
                        ],
                      nil];
    [self.tableView reloadData];
    
    return self;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? HEIGHT_TABLE_MARGIN_DEFAULT : HEIGHT_TABLE_MARGIN_ZERO;
}

- (void)actionUpdatePassword
{
    [self.delegate actionUpdatePassword];
}

@end
