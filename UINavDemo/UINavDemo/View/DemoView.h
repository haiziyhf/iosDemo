//
//  DemoView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/28.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseView.h"

@protocol DemoViewDelegate <NSObject>



@end

@interface DemoView : BaseView

@property (retain, nonatomic) id<DemoViewDelegate>delegate;

@end
