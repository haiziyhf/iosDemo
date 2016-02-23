//
//  YHFKeyboardView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/14.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "YHFKeyboardView.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define BORDERCOLOR [UIColor lightGrayColor].CGColor


@implementation YHFKeyboardView
{
    NSMutableArray *keyboardBtn;
    UITextField *makeField;
    NSMutableString *tempString;
    int position;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    position = 2;
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        tempString = [NSMutableString string];
        [self configBtns];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    }
    self.backgroundColor = [UIColor whiteColor];
    return self;

}

//输出数字
- (void)configBtns
{
    keyboardBtn = [NSMutableArray array];
    for (int i = 0;i < 10;i++) {
        UIButton *btn = [self makeButton:[NSString stringWithFormat:@"%d",i]];
        btn.tag = i;
        [btn addTarget:self action:@selector(actionBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [keyboardBtn addObject:btn];
        [self addSubview:btn];
    }
}

//打乱排序
- (void)randomBtn
{
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    NSMutableArray *btnData = [NSMutableArray arrayWithArray:keyboardBtn];
    for (int i = 0;i <= 9;i++) {
        CGRect btnFrame = CGRectMake(w/3*(i%3)+position, h/4*((int)i/3)+position, w/3-(position*2), h/4-(position*2));
        if (i == 9) {
            btnFrame = CGRectMake(w/3+position, h/4*3+position, w/3-(position*2), h/4-(position*2));
        }
        UIButton *button = [UIButton new];
        int randomIndex = arc4random()%btnData.count;
        button = btnData[randomIndex];
        [btnData removeObjectAtIndex:randomIndex];
        button.frame = btnFrame;
    }
}

//删除按钮
- (void)deleteButton
{
    UIButton *delBtn = [self makeButton:@"删除"];
    delBtn.frame = CGRectMake(position, self.frame.size.height/4*3+position, SCREENWIDTH/3-(position*2), self.frame.size.height/4-(position*2));
    [delBtn addTarget:self action:@selector(actionDelete) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:delBtn];
}

//确认按钮
- (void)returnButton
{
    UIButton *button = [self makeButton:@"确定"];
    button.frame = CGRectMake(self.frame.size.width/3*2+position, self.frame.size.height/4*3+position, SCREENWIDTH/3-(position*2), self.frame.size.height/4-(position*2));
    [button addTarget:self action:@selector(actionReturnBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (UIButton *)makeButton:(NSString *)title
{
    UIButton *button = [[UIButton alloc] init];
    button.layer.borderWidth = 0.5f;
    button.layer.borderColor = BORDERCOLOR;
    button.layer.cornerRadius = 3.0f;
    button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return button;
}

- (void)makeField:(UITextField *)field
{
    makeField = field;
    makeField.inputView = self;
}

//键盘隐藏
- (void)keyboardDidHide:(NSNotification *)notification
{
    
}

//键盘即将出现的时候
- (void)keyboardWillShow:(NSNotification *)notification
{
    [self randomBtn];
    [self deleteButton];
    [self returnButton];
}

//键盘出现
- (void)keyboardDidShow:(NSNotification *)notification
{
    
}

//删除操作
- (void)actionDelete
{
    tempString = [NSMutableString stringWithString:makeField.text];
    NSUInteger length = tempString.length;
    if (length > 0) {
        tempString = [NSMutableString stringWithString:[tempString substringToIndex:length - 1]];
        makeField.text = tempString;
    }
}

//确认操作
- (void)actionReturnBtn
{
    [makeField resignFirstResponder];
}

//点击数字操作
- (void)actionBtn:(UIButton *)sender
{
    NSString *text = sender.titleLabel.text;
    [tempString appendString:text];
    makeField.text = tempString;
}


@end
