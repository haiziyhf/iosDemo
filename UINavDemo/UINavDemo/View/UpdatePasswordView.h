//
//  UpdatePasswordView.h
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/5.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "BaseView.h"

@protocol UpdatePasswordDelegate <NSObject>



@end

@interface UpdatePasswordView : BaseView

@property (retain, nonatomic) id<UpdatePasswordDelegate>delegate;

@end
