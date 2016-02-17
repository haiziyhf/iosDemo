//
//  GrabOneViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/29.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "GrabOneViewController.h"
#import "GrabOneView.h"
#import "PopupView.h"
#import "CNPPopupController.h"

@interface GrabOneViewController ()<GrabOneDelegate,PopupVieweDelegate,CNPPopupControllerDelegate>

@end

@implementation GrabOneViewController
{
    CNPPopupController *cnPopupController;
    PopupView *popupView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GrabOneView *grabOneView = [[GrabOneView alloc] init];
    grabOneView.delegate = self;
    self.view = grabOneView;
    
    self.navigationItem.title = @"抢单效果";
    
}

- (void)actionShowPopup
{
    //弹出框容器
    UIView *popupView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_AVAILABLE_HEIGHT)];
    
    //弹出框视图
    popupView = [[PopupView alloc] init];
    popupView.delegate = self;
    [popupView1 addSubview:popupView];
    
    [popupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(popupView1).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    //显示弹出框
    cnPopupController = [[CNPPopupController alloc] initWithContents:@[popupView1]];
    cnPopupController.theme = [CNPPopupTheme defaultTheme];
    cnPopupController.theme.popupStyle = CNPPopupStyleActionSheet;
    cnPopupController.theme.cornerRadius = 0;
    cnPopupController.theme.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];    cnPopupController.theme.popupContentInsets = UIEdgeInsetsZero;
    cnPopupController.theme.presentationStyle = CNPPopupPresentationStyleSlideInFromTop;
    cnPopupController.theme.maskType = CNPPopupMaskTypeDimmed;
    cnPopupController.theme.contentVerticalPadding = 0;
    cnPopupController.theme.maxPopupWidth = SCREEN_WIDTH;
    cnPopupController.theme.shouldDismissOnBackgroundTouch = YES;
    cnPopupController.delegate = self;

    [cnPopupController presentPopupControllerAnimated:YES];
}

- (void)popupControllerDidDismiss:(CNPPopupController *)controller
{
    cnPopupController = nil;
    popupView = nil;
}

- (void)actionPopupClose
{
    [cnPopupController dismissPopupControllerAnimated:YES];
}

@end
