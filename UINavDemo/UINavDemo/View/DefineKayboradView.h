//
//  DefineKayboradView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/14.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseView.h"

@protocol DefineKeyboardViewDelegate <NSObject>



@end

@interface DefineKayboradView : BaseView

@property (retain, nonatomic) id<DefineKeyboardViewDelegate>delegate;

@end
