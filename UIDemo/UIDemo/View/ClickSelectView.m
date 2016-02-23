//
//  ClickSelectView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/19.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "ClickSelectView.h"

@implementation ClickSelectView
{
    UIView *boxView;
    NSArray *data;
    NSMutableArray *topData;
    NSMutableArray *bottomData;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    UIView *superView = self;
    
    boxView = [[UIView alloc] init];
    boxView.backgroundColor = [UIColor whiteColor];
    [self addSubview:boxView];
    
    [boxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top);
        make.left.equalTo(superView.mas_left);
        make.right.equalTo(superView.mas_right);
        
        make.height.equalTo(@200);
    }];

    
    UIButton *titleBtn = [[UIButton alloc] init];
    titleBtn.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    titleBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    titleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [titleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [titleBtn setTitle:@"列表" forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self addSubview:titleBtn];
    
    [titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(boxView.mas_bottom);
        make.left.equalTo(superView.mas_left);
        make.right.equalTo(superView.mas_right);
        
        make.height.equalTo(@50);
    }];
    
    data = @[
              @{@"key":@1000,@"name":@"小炒肉"},
              @{@"key":@1001,@"name":@"鱼香肉丝"},
              @{@"key":@1002,@"name":@"毛血旺"},
              @{@"key":@1003,@"name":@"酸菜鱼"},
              @{@"key":@1004,@"name":@"回锅肉"},
              @{@"key":@1005,@"name":@"红烧肉"},
              @{@"key":@1006,@"name":@"酸辣土豆丝"},
              ];
    topData = [[NSMutableArray alloc] init];
    bottomData = [[NSMutableArray alloc] initWithArray:data];
    [self bottomView];
    
    return self;
}

- (void)bottomView
{
    NSMutableArray *dicData = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in bottomData) {
        [dicData addObject:@{@"id" : @"info", @"type": @"custom", @"action": @"", @"image": @"", @"text" : [dic objectForKey:@"name"], @"data" : @"", @"height": @45}];
    }
    self.tableView.tableHeaderView = ({
       UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 250.0f)];
        
        headerView;
    });
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableData = [[NSMutableArray alloc] initWithObjects:dicData,nil];
    [self.tableView reloadData];

}

- (void)initTopData
{
    for (UIView * view in boxView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat w = 5;
    CGFloat h = 5;
    
    for (int i = 0;i < topData.count;i++) {
        NSDictionary *dic = topData[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.borderWidth = 0.5f;
        btn.layer.borderColor = [UIColor grayColor].CGColor;
        btn.layer.cornerRadius = 3.0f;
        NSInteger tag = [[dic objectForKey:@"key"] integerValue];
        btn.tag = tag;
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        [btn setTitle:[dic objectForKey:@"name"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn.titleLabel sizeToFit];
        
        CGSize btnSize = btn.titleLabel.frame.size;
        CGFloat width = (btnSize.width > 50 ? btnSize.width : 50) + 10;
        [boxView addSubview:btn];
        
        CGFloat x = self.frame.size.width;
        if (x < width + w) {
            h += 35;
            w = 5;
        }
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(boxView.mas_top).offset(h);
            make.left.equalTo(boxView.mas_left).offset(w);
            
            make.width.equalTo(@(width));
            make.height.equalTo(@30);
        }];
        w += width + 5;
        
    }

}

//选择数据操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = bottomData[indexPath.row];
    [topData addObject:dic];
    [bottomData removeObjectAtIndex:indexPath.row];
    [self initTopData];
    [self bottomView];
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView customCellForRowAtIndexPath:(NSIndexPath *)indexPath withCell:(UITableViewCell *)cell
{
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    return cell;
}

//选择的按钮事件
- (void)actionBtn:(UIButton *)sender
{
    sender.backgroundColor = [UIColor grayColor];
    NSArray *arr = [topData copy];
    NSInteger tag = sender.tag;
    
    for (int i = 0;i < arr.count;i++) {
        NSDictionary *dic = arr[i];
        NSInteger curTag = [[dic objectForKey:@"key"] integerValue];
        if (curTag == tag) {
            [bottomData addObject:topData[i]];
            [topData removeObjectAtIndex:i];
        }
    }
    
    [self initTopData];
    [self bottomView];
}

@end
