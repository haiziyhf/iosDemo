//
//  AlipayOrder.h
//  AlixPay
//
//  Created by 方彬 on 11/2/13.
//

#import <Foundation/Foundation.h>

@interface AlipayOrder : NSObject

@property(nonatomic, copy) NSString * partner;
@property(nonatomic, copy) NSString * seller;
@property(nonatomic, copy) NSString * tradeNO;
@property(nonatomic, copy) NSString * productName;
@property(nonatomic, copy) NSString * productDescription;
@property(nonatomic, copy) NSString * amount;
@property(nonatomic, copy) NSString * notifyURL;

@property(nonatomic, copy) NSString * service;
@property(nonatomic, copy) NSString * paymentType;
@property(nonatomic, copy) NSString * inputCharset;
@property(nonatomic, copy) NSString * itBPay;
@property(nonatomic, copy) NSString * showUrl;

@property(nonatomic, copy) NSString * rsaDate;//可选
@property(nonatomic, copy) NSString * appID;//可选

@property(nonatomic, copy) NSDictionary * extraParams;

//签名相关，不加入Spec
@property(nonatomic, copy) NSString * sign;
@property(nonatomic, copy) NSString * signType;

//将商品信息拼接成字符串
- (NSString *)orderSpec;

//将签名成功字符串格式化为订单字符串,请严格按照该格式
- (NSString *)orderStr;

@end