//
//  MenuViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/24.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
{
    UIPanGestureRecognizer *recognizer;
    NSArray *menuList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuList = [[NSArray alloc] initWithObjects:
                @[@"首页",@"HomeViewController",@"show"],
                @[@"设置",@"SettingViewController",@"push"],
                @[@"我的相册",@"PhotoViewController",@"show"],
                @[@"我的资料",@"MaterialViewController",@"show"],
                @[@"按钮选择",@"ButtonListViewController",@"push"],
                nil];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"nopic.png"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = @"Haizi";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:imageView];
        [view addSubview:label];
        view;
    });
    
    //去掉多余的表格
    UIView *tableFooterView = [[UIView alloc] init];
    tableFooterView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 44);
    self.tableView.tableFooterView = tableFooterView;
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *menu = [menuList objectAtIndex:[indexPath row]];

    UIViewController *viewController = [[NSClassFromString([menu objectAtIndex:1]) alloc] init];
    
    UINavigationController *navigationController = (UINavigationController *) self.frostedViewController.contentViewController;
    //push有返回按钮
    if ([@"push" isEqualToString:[menu objectAtIndex:2]]) {
        [navigationController pushViewController:viewController animated:YES];
    } else {
        [navigationController setViewControllers:[NSArray arrayWithObject:viewController] animated:YES];
    }
    
    //隐藏菜单
    [self.frostedViewController hideMenuViewController];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [menuList count];
}

//让分割线左侧不留空白
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSArray *menu = [menuList objectAtIndex:[indexPath row]];
    cell.textLabel.text = [menu objectAtIndex:0];
    
    
    return cell;
}


@end
