//
//  ASIHttpMangment.h
//  IBM
//
//  Created by love_ping891122 on 14-5-27.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"


#define IBMIP @"www.jsahdjas.com"

@interface ASIHttpMangment : NSObject<ASIHTTPRequestDelegate>







/**登陆，注册，修改密码**/
+(void)AccountWithRequestURL:(NSString *)URLString
                   pragram:(NSDictionary *)pragram
                   success:(void (^)( NSDictionary* resultObject))success
                      fail:(void (^)( NSDictionary *errdic))fail;

//验证手机号
+(void)telphoneNumWithRequestURL:(NSString *)URLString
                         pragram:(NSDictionary *)pragram
                         success:(void (^)( NSDictionary* resultObject))success
                            fail:(void (^)( NSDictionary *errdic))fail;
//获取time
+(void)getTimeinfoWithRequestURL:(NSString *)URLString
                         pragram:(NSDictionary *)pragram
                         success:(void (^)( NSDictionary* resultObject))success
                            fail:(void (^)( NSDictionary *errdic))fail;
//获取banner图片列表
+(void)getbannerinfoWithRequestURL:(NSString *)URLString
                           pragram:(NSDictionary *)pragram
                           success:(void (^)( NSDictionary* resultObject))success
                              fail:(void (^)( NSDictionary *errdic))fail;

/**商品数据列表*/

+(void)ShoplistWithRequestURL:(NSString *)URLString
                   pragram:(NSDictionary *)pragram
                   success:(void (^)( NSDictionary* resultObject))success
                      fail:(void (^)( NSDictionary *errdic))fail;

/************************
 
 提交订单
 
 ************************/
+(void)submitorderWithRequestURL:(NSString *)URLString
                         pragram:(NSDictionary *)pragram
                         success:(void (^)( NSDictionary* resultObject))success
                            fail:(void (^)( NSDictionary *errdic))fail;



@end
