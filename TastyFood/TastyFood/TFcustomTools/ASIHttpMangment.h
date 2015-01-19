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
+(void)LoginWithRequestURL:(NSString *)URLString
                   pragram:(NSDictionary *)pragram
                   success:(void (^)( NSDictionary* resultObject))success
                      fail:(void (^)( NSDictionary *errdic))fail;

/**商品数据列表*/

+(void)ShoplistWithRequestURL:(NSString *)URLString
                   pragram:(NSDictionary *)pragram
                   success:(void (^)( NSDictionary* resultObject))success
                      fail:(void (^)( NSDictionary *errdic))fail;



@end
