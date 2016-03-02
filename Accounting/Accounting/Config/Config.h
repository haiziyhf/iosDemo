//
//  应用配置文件，包含此文件即可
//  Config.h
//  LttMember
//
//  Created by wuyong on 15/4/23.
//  Copyright (c) 2015年 Gilbert. All rights reserved.
//

#ifndef LttMember_Config_h
#define LttMember_Config_h


#pragma mark - 框架配置
/********框架配置>>>********/
#import "LttFramework.h"
/********<<<框架配置********/


#pragma mark - 环境配置
/********加载环境配置>>>********/
//环境配置
#ifdef APP_DEBUG
#import "Config_debug.h"
#else
#import "Config_product.h"
#endif
/********>>>加载环境配置********/


#pragma mark - 公用配置
/********公用配置>>>********/

//用户心跳时间
#define USER_HEARTBEAT_INTERVAL 60.0

//刷新位置间隔
#define USER_LOCATION_INTERVAL 60.0

//短信验证码发送间隔
#define USER_SMS_INTERVAL 60

//默认每页数量
#define LTT_PAGESIZE_DEFAULT 10

//颜色配置
#define COLOR_MAIN_BG [UIColor colorWithHexString:@"EEEEEE"]
#define COLOR_MAIN_BUTTON_BG [UIColor colorWithHexString:@"F38600"]
#define COLOR_MAIN_HIGHLIGHT [UIColor colorWithHexString:@"F38600"]
#define COLOR_MAIN_BORDER [UIColor colorWithHexString:@"B2B2B2"]
#define COLOR_MAIN_WHITE [UIColor whiteColor]
#define COLOR_MAIN_BLACK [UIColor blackColor]
#define COLOR_MAIN_CLEAR [UIColor clearColor]
#define COLOR_MAIN_DARK [UIColor colorWithHexString:@"585858"]
#define COLOR_MAIN_GRAY [UIColor colorWithHexString:@"7D7D7D"]
#define CGCOLOR_MAIN_BORDER [UIColor colorWithHexString:@"B2B2B2"].CGColor
#define CGCOLOR_MAIN_WHITE [UIColor whiteColor].CGColor
#define CGCOLOR_MAIN_HIGHLIGHT [UIColor colorWithHexString:@"F38600"].CGColor

//尺寸配置
#define FONT_MAIN [UIFont systemFontOfSize:16]
#define FONT_MAIN_BOLD [UIFont boldSystemFontOfSize:16]
#define FONT_MIDDLE [UIFont systemFontOfSize:14]
#define FONT_MIDDLE_BOLD [UIFont boldSystemFontOfSize:14]
#define FONT_SMALL [UIFont systemFontOfSize:12]
#define FONT_SMALL_BOLD [UIFont boldSystemFontOfSize:12]

//按钮配置
//中按钮高度
#define HEIGHT_MIDDLE_BUTTON 35
//大按钮高度
#define HEIGHT_MAIN_BUTTON 45

/********<<<公用配置********/


#endif
