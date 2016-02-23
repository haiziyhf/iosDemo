//
//  WaterfallsFlowViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/18.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "WaterfallsFlowViewController.h"
#import "WaterfallsFlowView.h"

@interface WaterfallsFlowViewController ()<WaterfallsFlowViewDelegate>

@end

@implementation WaterfallsFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WaterfallsFlowView *waterfallsFlowView = [[WaterfallsFlowView alloc] initWithFrame:self.view.frame];
    waterfallsFlowView.delegate = self;
    self.view = waterfallsFlowView;
    
    self.navigationItem.title = @"瀑布流排版";
    
}


@end
