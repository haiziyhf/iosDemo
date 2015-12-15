//
//  ViewController.m
//  DLRadioButton
//
//  Created by 杨海锋 on 15/12/15.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "ViewController.h"
#import "DLRadioButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //复选框
    DLRadioButton *radio = [[DLRadioButton alloc] init];
    radio.frame = CGRectMake(10, 50, 200, 20);
    //设置允许多选
    radio.multipleSelectionEnabled = YES;
    //设置为方形选择框
    radio.iconSquare = YES;
    radio.iconSize = 16;
    radio.iconColor = [UIColor redColor];
    radio.indicatorSize = 8.0f;
    radio.indicatorColor = [UIColor redColor];
    radio.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [radio addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [radio setTitle:@"多选1" forState:UIControlStateNormal];
    [radio setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:radio];
    
    DLRadioButton *radio1 = [[DLRadioButton alloc] init];
    radio1.frame = CGRectMake(10, 80, 200, 20);
    //设置允许多选
    radio1.multipleSelectionEnabled = YES;
    //设置为方形选择框
    radio1.iconSquare = YES;
    radio1.iconSize = 16;
    radio1.iconColor = [UIColor redColor];
    radio1.indicatorSize = 8.0f;
    radio1.indicatorColor = [UIColor redColor];
    radio1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [radio1 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [radio1 setTitle:@"多选2" forState:UIControlStateNormal];
    [radio1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:radio1];
    radio.otherButtons = @[radio1];

    
    //单选框
    DLRadioButton *radio2 = [[DLRadioButton alloc] init];
    radio2.frame = CGRectMake(10, 110, 200, 20);
    radio2.iconSize = 16;
    radio2.iconColor = [UIColor redColor];
    radio2.indicatorSize = 8.0f;
    radio2.indicatorColor = [UIColor redColor];
    radio2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [radio2 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [radio2 setTitle:@"单选1" forState:UIControlStateNormal];
    [radio2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:radio2];
    
    NSMutableArray *otherButtons = [NSMutableArray new];
    
    DLRadioButton *radio3 = [[DLRadioButton alloc] init];
    radio3.frame = CGRectMake(10, 140, 200, 20);
    radio3.iconSize = 16;
    radio3.iconColor = [UIColor redColor];
    radio3.indicatorSize = 8.0f;
    radio3.indicatorColor = [UIColor redColor];
    radio3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [radio3 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [radio3 setTitle:@"单选2" forState:UIControlStateNormal];
    [radio3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:radio3];
    [otherButtons addObject:radio3];
    
    DLRadioButton *radio4 = [[DLRadioButton alloc] init];
    radio4.frame = CGRectMake(10, 170, 200, 20);
    radio4.iconSize = 16;
    radio4.iconColor = [UIColor redColor];
    radio4.indicatorSize = 8.0f;
    radio4.indicatorColor = [UIColor redColor];
    radio4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [radio4 addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [radio4 setTitle:@"单选3" forState:UIControlStateNormal];
    [radio4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:radio4];
    [otherButtons addObject:radio4];
    radio2.otherButtons = otherButtons;


    
}

- (void)clickButton:(DLRadioButton *)radioButton
{
    if (radioButton.isMultipleSelectionEnabled) {
        for (DLRadioButton *button in radioButton.selectedButtons) {
            NSLog(@"选择了：%@",button.titleLabel.text);
        }
    } else {
        NSLog(@"单选了：%@",radioButton.titleLabel.text);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
