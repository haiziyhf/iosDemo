//
//  NavViewController.h
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/24.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavViewController : UINavigationController

- (void)menuEnable: (BOOL) enable;

- (void)showMenu;

- (void) menuGestured:(BOOL)gestured;

@end
