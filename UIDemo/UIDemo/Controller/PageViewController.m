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
    UIPageControl *pageControl;
    UIScrollView *_scrollView;
    NSArray *imageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"循环展示";
    
    imageArray = @[
                   @"IMG_001.JPG",
                   @"IMG_002.JPG",
                   @"IMG_003.JPG",
                   @"IMG_004.JPG",
                   @"IMG_005.JPG",
                   @"IMG_006.JPG",
                   @"IMG_007.JPG",
                   @"IMG_008.JPG",
                   @"IMG_009.JPG"
                   ];
    
    [self setScrollView];
    
    [self setImage];
    
    [self setPageControl];
}

- (void)setScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _scrollView.delegate = self;
    //设置内容的大小
    _scrollView.contentSize = CGSizeMake(width * (imageArray.count + 2), height);
    //设置滚动偏移量
    _scrollView.contentOffset = CGPointMake(width, 0);
    //设置整屏滚动
    _scrollView.pagingEnabled = YES;
    //隐藏水平滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    //隐藏垂直滚动条
    _scrollView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_scrollView];
}

- (void)setImage
{
    for (int i = 0;i < imageArray.count + 2;i++) {
        UIScrollView *s = [[UIScrollView alloc]initWithFrame:CGRectMake(i * width, 0, width, height)];

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRectMake(-1, -1, width+2, height+2))];
        if (i == 0) {
            imageView.image = [UIImage imageNamed:imageArray[imageArray.count - 1]];
        } else if (i == imageArray.count + 1) {
            imageView.image = [UIImage imageNamed:imageArray[0]];
        } else {
            imageView.image = [UIImage imageNamed:imageArray[i-1]];
        }
        imageView.userInteractionEnabled = YES;
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        [s addSubview:imageView];
        [_scrollView addSubview:s];
    }
}

- (void)setPageControl
{
    pageControl = [[UIPageControl alloc] initWithFrame:(CGRectMake(width / 10, height - 100 ,width - width / 5, 20))];
    //显示多少页
    pageControl.numberOfPages = imageArray.count;
    //当前页
    pageControl.currentPage = 0;
    //小点颜色
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    //当前点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [pageControl addTarget:self action:@selector(actionChange:) forControlEvents:UIControlEventTouchUpInside];
    pageControl.defersCurrentPageDisplay = YES;
    
    [self.view addSubview:pageControl];
}

- (void)actionChange:(UIPageControl *)pControl
{
    NSInteger page = pControl.currentPage;
    CGFloat x = page * width;
    [_scrollView setContentOffset:(CGPointMake(x, 0)) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger x = scrollView.contentOffset.x/width;
    if (x == imageArray.count +1) {
        [scrollView setContentOffset:CGPointMake(width, 0) animated:NO];
        [pageControl setCurrentPage:0];
    }else if (scrollView.contentOffset.x <= 0) {
        [scrollView setContentOffset:CGPointMake(width * imageArray.count,0) animated:NO];
        [pageControl setCurrentPage:imageArray.count-1];
    }else {
        [pageControl setCurrentPage:x-1];
    }
}

@end
