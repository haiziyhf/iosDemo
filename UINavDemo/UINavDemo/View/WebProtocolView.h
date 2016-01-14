//
//  WebView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/13.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseView.h"

@protocol WebProtocolViewDelegate <NSObject>

@end

@interface WebProtocolView : BaseView

@property (retain, nonatomic) id<WebProtocolViewDelegate>delegate;

- (void)stopWeb;

@end
