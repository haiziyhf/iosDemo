//
//  DemoView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/28.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "DemoView.h"

@implementation DemoView

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    self.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    UIView *superView = self;
    int padding = 10;
    
    NSString *str = @"我们很好的我们很好的，我们很好的我们很好的我们很好的我们很好的我们很好的我们很好的我们很好的我们很好的我们很好的我们很好的我们很好的我们很好的";
    CGSize size = CGSizeMake(250, 2000);
    if (IS_IOS7_PLUS) {
        size = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Arial" size:16]} context:nil].size;
    } else {
        size = [str sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    }
    CGFloat height = size.height+4;//获取自适应文本内容高度
    
    UILabel *labelName = [[UILabel alloc] init];
    labelName.layer.borderWidth = 0.5f;
    labelName.layer.borderColor = [UIColor grayColor].CGColor;
    labelName.layer.cornerRadius = 3.0f;
    labelName.numberOfLines = 0;
    labelName.font = [UIFont systemFontOfSize:16];
    labelName.backgroundColor = [UIColor whiteColor];
    labelName.text = str;
    labelName.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:labelName];
    
    CGFloat labelHeight = height;
    [labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        
        make.height.equalTo(@(labelHeight));
    }];
    
    NSRange contentRange = {2,5};
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:str];
    //设置下划线
    [attrString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    //设置字体颜色
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(7, 3)];
    //设置字体加粗
    [attrString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:16.0] range:NSMakeRange(10, 3)];
    
    UILabel *underlineLabel = [[UILabel alloc] init];
    underlineLabel.backgroundColor = [UIColor whiteColor];
    underlineLabel.attributedText = attrString;
    [self addSubview:underlineLabel];
    
    [underlineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelName.mas_bottom).offset(padding);
        make.left.equalTo(superView.mas_left).offset(padding);
        make.right.equalTo(superView.mas_right).offset(-padding);
        
        make.height.equalTo(@50);
    }];
    
    return self;
}

@end
