//
//  WaterfallsFlowView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/18.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseView.h"

@protocol WaterfallsFlowViewDelegate <NSObject>


@end

@interface WaterfallsFlowView : BaseView

@property (retain, nonatomic) id<WaterfallsFlowViewDelegate>delegate;

@end
