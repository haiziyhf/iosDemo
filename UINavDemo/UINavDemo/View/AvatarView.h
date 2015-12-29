//
//  AvatarView.h
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/28.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "BaseTableView.h"

@protocol AvatarViewDelegate <NSObject>

- (void)actionAvatar;

- (void)actionNickname;

- (void)actionSex;

@end

@interface AvatarView : BaseTableView

@property (retain, nonatomic) id<AvatarViewDelegate>delegate;

@end
