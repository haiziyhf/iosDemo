/*
 Copyright (c) 2014 ideawu. All rights reserved.
 Use of this source code is governed by a license that can be
 found in the LICENSE file.
 
 @author:  ideawu
 @website: http://www.cocoaui.com/
 */

#ifndef IKit_IView_h
#define IKit_IView_h

#import <UIKit/UIKit.h>
#import "IStyle.h"

typedef enum{
	IEventUnhighlight  = 1<<0,
	IEventHighlight    = 1<<1,
	IEventClick        = 1<<2,
	IEventTap          = IEventClick,
	IEventChange       = 1<<3,
	IEventReturn       = 1<<4,
	FIEventClick       = 1<<2,
}IEventType;

typedef enum{
	IRefreshNone,
	IRefreshMaybe,
	IRefreshBegin,
}IRefreshState;

@class ITable;
@class IView;

//为重构需要，只能使用FIView,FIViewDelegate,FIEvent,FIViewCallback
typedef IView FIView;
typedef IEventType FIEvent;

@protocol FIViewDelegate <NSObject>

@optional
- (void)renderTitle:(NSString *)title;
- (void)renderMeta:(NSDictionary *)meta;

@end

@interface IView : UIView

//创建相关
+ (IView *)viewWithString:(NSString *)string;

+ (IView *)viewWithString:(NSString *)string basePath:(NSString *)basePath;

+ (IView *)viewWithFile:(NSString *)file;

+ (IView *)viewWithName:(NSString *)name;

+ (void)viewWithUrl:(NSString *)url callback:(void (^)(FIView *view))callback;

//样式相关
- (void)css:(NSString *)css;
//todo:attr get?
- (NSString *)attr:(NSString *)name;
- (void)attr:(NSString *)name value:(NSString *)value;
//todo:text get?
- (NSString *)text;
- (void)text:(NSString *)value;

//文档相关
- (IView *)getElementById:(NSString *)id;

@property (nonatomic, readonly) IStyle *style;

//事件代理
@property (nonatomic, retain) id delegate;

+ (IView *)viewWithUIView:(UIView *)view;
+ (IView *)viewWithUIView:(UIView *)view style:(NSString *)css;

+ (IView *)namedView:(NSString *)name;
+ (IView *)viewFromXml:(NSString *)xml;
+ (IView *)viewWithContentsOfFile:(NSString *)path;

/**
 * Return the ITable which this view is in, if and only if this view is
 * an instance of the view class registered by ITable.registerViewClass.
 * NOTICE: become nil after this view is removed from ITable.
 */
- (ITable *)table;

- (id)data;
/**
 * override this method when IView is used as ITable row(MUST call [super setData])
 */
- (void)setData:(id)data;

// only available when init with xml or file
- (IView *)getViewById:(NSString *)vid;

/**
 * Add a view(instance of UIView or IView subclass) into subviews list,
 * apply style on the added view.
 */
- (void)addSubview:(UIView *)view style:(NSString *)css;
/**
 * This method will traverse up the view hierarchy to find and return
 * the first UIViewController, if not any found, it will return nil.
 */
- (UIViewController *)viewController;

- (void)show;
- (void)hide;
- (void)toggle;

- (void)bindEvent:(IEventType)event handler:(void (^)(IEventType event, IView *view))handler;
/**
 * event can be combined by | operator.
 */
- (void)addEvent:(IEventType)event handler:(void (^)(IEventType event, IView *view))handler;
/**
 * event can not be combined.
 */
- (BOOL)fireEvent:(IEventType)event;

@end

#endif
