//
//  PageViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/2/16.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "PageViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define height [UIScreen mainScreen].bounds.size.height

@interface PageViewController ()<UIScrollViewDelegate>

@end

@implementation PageViewController
{
    UIPageControl *page;
    UIScrollView *scrollView;
    NSMutableArray *imageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.delegate = self;
    
    imageArray = [NSMutableArray array];
    
    int j = 0;
    for (int i = 1;i < 10;i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRectMake(width * j, 0, width, height))];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"IMG_00%d.JPG",i]];
        [imageArray addObject:imageView];
        [scrollView addSubview:imageView];
        j++;
    }
    //设置内容的大小
    scrollView.contentSize = CGSizeMake(width * imageArray.count, height);
    //设置滚动偏移量
    //scrollView.contentOffset = CGPointMake(0, 0);
    //设置整屏滚动
    scrollView.pagingEnabled = YES;
    //隐藏水平滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    //隐藏垂直滚动条
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
}
@end
