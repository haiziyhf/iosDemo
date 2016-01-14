//
//  WebView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/13.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "WebProtocolView.h"

@interface WebProtocolView ()<UIWebViewDelegate>

@end

@implementation WebProtocolView
{
    UIWebView *webView;
    UIActivityIndicatorView *loadingView;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    UIView *superView = self;
    
    //网络视图
    webView = [[UIWebView alloc] init];
    //自动伸缩页面以适应屏幕
    webView.scalesPageToFit = YES;
    webView.scrollView.bounces = NO;
    webView.scrollView.showsHorizontalScrollIndicator = NO;
    webView.scrollView.showsVerticalScrollIndicator = NO;
    webView.opaque = NO;
    webView.backgroundColor = [UIColor whiteColor];
    webView.delegate = self;
    [self addSubview:webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView.mas_top);
        make.left.equalTo(superView.mas_left);
        make.bottom.equalTo(superView.mas_bottom);
        make.right.equalTo(superView.mas_right);
    }];
    
    //加载中
    loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:loadingView];
    
    [loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(webView.mas_centerX);
        make.centerY.equalTo(webView.mas_centerY);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    //加载网页
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [webView loadRequest:request];
    return self;
}

- (void)stopWeb
{
    if (webView) {
        [webView stopLoading];
        webView.delegate = nil;
        [webView removeFromSuperview];
        webView = nil;
    }
}

#pragma mark - WebView
- (void)webViewDidStartLoad:(UIWebView *)_webView
{
    [loadingView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)_webView
{
    [loadingView stopAnimating];
    [loadingView removeFromSuperview];
    
    webView.opaque = YES;
}

@end
