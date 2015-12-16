//
//  ViewController.m
//  SKDropDown
//
//  Created by 杨海锋 on 15/12/16.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "ViewController.h"
#import "SKDropDown.h"

@interface ViewController ()<SKDropDownDelegate>

@end

@implementation ViewController
{
    UIButton *button;
    NSArray *dropData;
    SKDropDown *selectDrop;
    SKDropDown *selectDropTwo;
    
    UIButton *buttonTwo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    selectDrop = nil;
    selectDropTwo = nil;
    
    dropData = @[@"redColor",@"blackColor",@"whiteColor",@"yellowColor",@"orangeColor"];
    
    button = [[UIButton alloc] init];
    button.frame = CGRectMake(10, 50, 120, 30);
    button.layer.borderWidth = 0.5f;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.layer.cornerRadius = 3.0f;
    [button addTarget:self action:@selector(showSKDrop) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"下拉测试" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    buttonTwo = [[UIButton alloc] init];
    buttonTwo.frame = CGRectMake(140, 50, 120, 30);
    buttonTwo.layer.borderWidth = 0.5f;
    buttonTwo.layer.borderColor = [UIColor grayColor].CGColor;
    buttonTwo.backgroundColor = [UIColor redColor];
    buttonTwo.titleLabel.font = [UIFont systemFontOfSize:16];
    buttonTwo.layer.cornerRadius = 3.0f;
    [buttonTwo addTarget:self action:@selector(showSKDropTwo) forControlEvents:UIControlEventTouchUpInside];
    [buttonTwo setTitle:@"selectTest" forState:UIControlStateNormal];
    [buttonTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:buttonTwo];

    
}

- (void)showDropDown:(UIButton *)sender tag:(NSInteger)tag
{
    SKDropDown *dropDown = [[SKDropDown alloc] showDropDown:sender withHeight:140 withData:dropData animationDirection:@"down"];
    dropDown.delegate = self;
    dropDown.tag = tag;
    
    switch (tag) {
        case 1:
            selectDrop = dropDown;
            break;
        case 2:
            selectDropTwo = dropDown;
            break;
        default:
            break;
    }
}

- (void)showSKDrop
{
    if (selectDrop == nil) {
        [self showDropDown:button tag:1];
    } else {
        [selectDrop hideDropDown:button];
        selectDrop = nil;
    }
}

- (void)showSKDropTwo
{
    if (selectDropTwo == nil) {
        [self showDropDown:buttonTwo tag:2];
    } else {
        [selectDropTwo hideDropDown:buttonTwo];
        selectDropTwo = nil;
    }
}




//下拉列表每行的高度
- (CGFloat) dropDown:(SKDropDown *)dropDown heightForRow:(NSIndexPath *)indexPath
{
    return 35;
}

- (void) dropDown:(SKDropDown *)dropDown didSelectRow:(NSIndexPath *)indexPath
{
    switch (dropDown.tag) {
        case 1:
            NSLog(@"所选择的Color值是：%@",dropData[indexPath.row]);
            selectDrop = nil;
            break;
        case 2:
            NSLog(@"所选择的Select值是：%@",dropData[indexPath.row]);
            selectDropTwo = nil;
            break;
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
