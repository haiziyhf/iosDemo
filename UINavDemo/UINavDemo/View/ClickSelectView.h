//
//  ClickSelectView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/19.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseTableView.h"

@protocol ClickSelectViewDelegate <NSObject>


@end

@interface ClickSelectView : BaseTableView

@property (retain, nonatomic) id<ClickSelectViewDelegate>delegate;

@end
