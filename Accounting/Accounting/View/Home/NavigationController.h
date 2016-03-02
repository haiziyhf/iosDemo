//
//  LttNavigationController.h
//  LttMerchant
//
//  Created by wuyong on 15/4/27.
//  Copyright (c) 2015年 Gilbert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "MenuViewController.h"

@interface NavigationController : UINavigationController

- (void)showMenu;

- (void)menuEnable: (BOOL) enable;

- (void)menuGestured: (BOOL) gestured;

@end
