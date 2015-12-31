//
//  AddressView.h
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/31.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "BaseView.h"

@protocol AddressViewDelegate <NSObject>

- (void)showAddressList;

- (void)showTwoPick;

- (void)showThreePick;

@end

@interface AddressView : BaseView

@property (retain, nonatomic) id<AddressViewDelegate>delegate;

@end
