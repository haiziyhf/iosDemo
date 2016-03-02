//
//  ZCTradeView.m
//  直销银行
//
//  Created by 塔利班 on 15/4/30.
//  Copyright (c) 2015年 联创智融. All rights reserved.
//

// 设备判断
/**
 iOS设备宽高比
 4\4s {320, 480}  5s\5c {320, 568}  6 {375, 667}  6+ {414, 736}
 0.66             0.56              0.56          0.56
 */
#define iphone5  ([UIScreen mainScreen].bounds.size.height == 568)
#define iphone6  ([UIScreen mainScreen].bounds.size.height == 667)
#define iphone6Plus  ([UIScreen mainScreen].bounds.size.height == 736)
#define iphone4  ([UIScreen mainScreen].bounds.size.height == 480)
#define ipadMini2  ([UIScreen mainScreen].bounds.size.height == 1024)

#import "ZCTradeView.h"
#import "ZCTradeKeyboard.h"
#import "ZCTradeInputView.h"

@interface ZCTradeView ()
/** 键盘 */
@property (nonatomic, weak) ZCTradeKeyboard *keyboard;
/** 输入框 */
@property (nonatomic, weak) ZCTradeInputView *inputView;
/** 蒙板 */
@property (nonatomic, weak) UIButton *cover;
/** 响应者 */
@property (nonatomic, weak) UITextField *responsder;
/** 键盘状态 */
@property (nonatomic, assign, getter=isKeyboardShow) BOOL keyboardShow;
/** 返回密码 */
@property (nonatomic, copy) NSString *passWord;
@end

@implementation ZCTradeView

#pragma mark - LifeCircle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:ZCScreenBounds];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        /** 蒙板 */
        [self setupCover];
        /** 键盘 */
        [self setupkeyboard];
        /** 输入框 */
        [self setupInputView];
        /** 响应者 */
        [self setupResponsder];
    }
    return self;
}

/** 蒙板 */
- (void)setupCover
{
    UIButton *cover = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:cover];
    self.cover = cover;
    [self.cover setBackgroundColor:[UIColor blackColor]];
    self.cover.alpha = 0.4;
    [self.cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
}

/** 输入框 */
- (void)setupInputView
{
    ZCTradeInputView *inputView = [[ZCTradeInputView alloc] init];
    [self addSubview:inputView];
    self.inputView = inputView;
    
    /** 注册取消按钮点击的通知 */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cancle) name:ZCTradeInputViewCancleButtonClick object:nil];
    /** 注册确定按钮点击的通知 */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inputViewOk:) name:ZCTradeInputViewOkButtonClick object:nil];
}

/** 响应者 */
- (void)setupResponsder
{
    UITextField *responsder = [[UITextField alloc] init];
    [self addSubview:responsder];
    self.responsder = responsder;
}

/** 键盘 */
- (void)setupkeyboard
{
    ZCTradeKeyboard *keyboard = [[ZCTradeKeyboard alloc] init];
    [self addSubview:keyboard];
    self.keyboard = keyboard;
    
    // 注册确定按钮点击通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ok) name:ZCTradeKeyboardOkButtonClick object:nil];
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    /** 蒙板 */
    self.cover.frame = self.bounds;
}

#pragma mark - Private

- (void)coverClick
{
    if (self.isKeyboardShow) {  // 键盘是弹出状态
        [self hidenKeyboard:nil];
    } else {  // 键盘是隐藏状态
        [self showKeyboard];
    }
}

/** 键盘弹出 */
- (void)showKeyboard
{
    self.keyboardShow = YES;
    
    CGFloat marginTop;
    if (iphone4) {
        marginTop = 42;
    } else if (iphone5) {
        marginTop = 100;
    } else if (iphone6) {
        marginTop = 120;
    } else {
        marginTop = 140;
    }
    
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.keyboard.transform = CGAffineTransformMakeTranslation(0, -self.keyboard.height);
        self.inputView.transform = CGAffineTransformMakeTranslation(0, marginTop - self.inputView.y);
    } completion:^(BOOL finished) {
        
    }];
}

/** 键盘退下 */
- (void)hidenKeyboard:(void (^)(BOOL finished))completion
{
    self.keyboardShow = NO;

    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.keyboard.transform = CGAffineTransformIdentity;
        self.inputView.transform = CGAffineTransformIdentity;
    } completion:completion];
}

/** 键盘的确定按钮点击 */
- (void)ok
{
    [self hidenKeyboard:nil];
}

/** 输入框的取消按钮点击 */
- (void)cancle
{
    // 通知代理\传递密码
    BOOL result = YES;
    if ([self.delegate respondsToSelector:@selector(tradeViewCancel)]) {
        result = [self.delegate tradeViewCancel];
    }
    // 回调block\传递密码
    if (self.cancel) {
        result = self.cancel();
    }
    
    // 移除自己
    if (result) {
        [self hide];
    }
}

/** 输入框的确定按钮点击 */
- (void)inputViewOk:(NSNotification *)note
{
    // 获取密码
    NSString *pwd = note.userInfo[ZCTradeInputViewPwdKey];
    BOOL result = YES;
    // 通知代理\传递密码
    if ([self.delegate respondsToSelector:@selector(tradeViewFinish:)]) {
        result = [self.delegate tradeViewFinish:pwd];
    }
    // 回调block\传递密码
    if (self.finish) {
        result = self.finish(pwd);
    }
    
    // 移除自己
    if (result) {
        [self hide];
    }
}

#pragma mark - Public Interface

/** 快速创建 */
+ (instancetype)tradeView
{
    return [[self alloc] init];
}

/** 弹出 */
- (void)show
{
    [self showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)showInView:(UIView *)view
{
    // 浮现
    [view addSubview:self];
    
    /** 键盘起始frame */
    self.keyboard.x = 0;
    self.keyboard.y = ZCScreenHeight;
    self.keyboard.width = ZCScreenWidth;
    self.keyboard.height = ZCScreenWidth * 0.65;
    
    /** 输入框起始frame */
    self.inputView.height = ZCScreenWidth * 0.5625;
    self.inputView.y = (self.height - self.inputView.height) * 0.5;
    self.inputView.width = ZCScreenWidth * 0.94375;
    self.inputView.x = (ZCScreenWidth - self.inputView.width) * 0.5;
    
    /** 弹出键盘 */
    [self showKeyboard];
}

- (void)hide
{
    [self hide:nil];
}

- (void)hide:(void (^)())completion
{
    // 移除自己
    [self hidenKeyboard:^(BOOL finished) {
        [self removeFromSuperview];
        if (completion) completion();
    }];
}

- (void)shake
{
    [self.inputView shakeAnimation];
}

- (void)setTitle:(NSString *)title color:(UIColor *)color
{
    [self.inputView setTitle:title color:color];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
