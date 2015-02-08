//
//  ASIHttpMangment.m
//  IBM
//
//  Created by love_ping891122 on 14-5-27.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "ASIHttpMangment.h"
#import "ASIFormDataRequest.h"

#import <CommonCrypto/CommonCryptor.h>

@implementation ASIHttpMangment





/************************
 
 登陆 注册 修改密码
 
 ************************/
+(void)AccountWithRequestURL:(NSString *)URLString
                   pragram:(NSDictionary *)pragram
                   success:(void (^)( NSDictionary* resultObject))success
                      fail:(void (^)( NSDictionary *errdic))fail
{
    
    __weak __block ASIHTTPRequest *Requestmanager = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:URLString]];
    NSData *bodydata =[[pragram JSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [Requestmanager appendPostData:bodydata];
    [Requestmanager setCompletionBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
        NSData *data =[Requestmanager responseData];
        
        
        NSDictionary *dicinfo = [data objectFromJSONData];
        NSDictionary *dic1 = @{@"code":[NSNumber numberWithInt:Statuscode],@"responsedata":dicinfo};
        success(dic1);
    }];
    [Requestmanager setFailedBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
    }];
    [Requestmanager addRequestHeader:@"Content-Type" value:@"application/json"];
    [Requestmanager setDelegate:self];
    [Requestmanager setRequestMethod:@"POST"];
    [Requestmanager setTimeOutSeconds:6.f];
    [Requestmanager startAsynchronous];
}
//验证手机号
+(void)telphoneNumWithRequestURL:(NSString *)URLString
                     pragram:(NSDictionary *)pragram
                     success:(void (^)( NSDictionary* resultObject))success
                        fail:(void (^)( NSDictionary *errdic))fail
{
    
    __weak __block ASIFormDataRequest *Requestmanager = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    if (pragram !=nil) {
        [pragram enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            [Requestmanager addPostValue:obj forKey:key];
        }];
    }
    
    [Requestmanager setCompletionBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
        NSData *data =[Requestmanager responseData];
        
        
        NSDictionary *dicinfo = [data objectFromJSONData];
        NSDictionary *dic1 = @{@"code":[NSNumber numberWithInt:Statuscode],@"responsedata":dicinfo};
        success(dic1);
    }];
    [Requestmanager setFailedBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
    }];
    [Requestmanager addRequestHeader:@"Content-Type" value:@"application/json"];
    [Requestmanager setDelegate:self];
    [Requestmanager setRequestMethod:@"POST"];
    [Requestmanager setTimeOutSeconds:6.f];
    [Requestmanager startAsynchronous];
}

//获取time
+(void)getTimeinfoWithRequestURL:(NSString *)URLString
                           pragram:(NSDictionary *)pragram
                           success:(void (^)( NSDictionary* resultObject))success
                              fail:(void (^)( NSDictionary *errdic))fail
{
    
    __weak __block ASIFormDataRequest *Requestmanager = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    if (pragram !=nil) {
        [pragram enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            [Requestmanager addPostValue:obj forKey:key];
        }];
    }
    
    [Requestmanager setCompletionBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
        NSString *string = [Requestmanager responseString];
        NSDictionary *dic1 = @{@"code":[NSNumber numberWithInt:Statuscode],@"responsetime":string};
        success(dic1);
    }];
    [Requestmanager setFailedBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
    }];
    [Requestmanager addRequestHeader:@"Content-Type" value:@"application/json"];
    [Requestmanager setDelegate:self];
    [Requestmanager setRequestMethod:@"GET"];
    [Requestmanager setTimeOutSeconds:6.f];
    [Requestmanager startAsynchronous];
}

//获取banner图片列表
+(void)getbannerinfoWithRequestURL:(NSString *)URLString
                         pragram:(NSDictionary *)pragram
                         success:(void (^)( NSDictionary* resultObject))success
                            fail:(void (^)( NSDictionary *errdic))fail
{
    
    __weak __block ASIFormDataRequest *Requestmanager = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    if (pragram !=nil) {
        [pragram enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            [Requestmanager addPostValue:obj forKey:key];
        }];
    }
    
    [Requestmanager setCompletionBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
        NSData *data =[Requestmanager responseData];
        NSDictionary *dicinfo = [data objectFromJSONData];
        NSDictionary *dic1 = @{@"code":[NSNumber numberWithInt:Statuscode],@"responsedata":dicinfo};
        success(dic1);
    }];
    [Requestmanager setFailedBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
    }];
    [Requestmanager addRequestHeader:@"Content-Type" value:@"application/json"];
    [Requestmanager setDelegate:self];
    [Requestmanager setRequestMethod:@"GET"];
    [Requestmanager setTimeOutSeconds:6.f];
    [Requestmanager startAsynchronous];
}
/************************
 
 商品列表
 
 ************************/
+(void)ShoplistWithRequestURL:(NSString *)URLString
                     pragram:(NSDictionary *)pragram
                     success:(void (^)( NSDictionary* resultObject))success
                        fail:(void (^)( NSDictionary *errdic))fail
{
    
    __weak __block ASIHTTPRequest *Requestmanager = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:URLString]];
    NSData *bodydata =[[pragram JSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [Requestmanager appendPostData:bodydata];
    [Requestmanager setCompletionBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
        NSData *data =[Requestmanager responseData];
        NSDictionary *dicinfo = [data objectFromJSONData];
        NSDictionary *dic1 = @{@"code":[NSNumber numberWithInt:Statuscode],@"responsedata":dicinfo};
        success(dic1);
    }];
    [Requestmanager setFailedBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
    }];
    [Requestmanager addRequestHeader:@"Content-Type" value:@"application/json"];
    [Requestmanager setDelegate:self];
    [Requestmanager setRequestMethod:@"POST"];
    [Requestmanager setTimeOutSeconds:6.f];
    [Requestmanager startAsynchronous];
}





/************************
 
 提交订单
 
 ************************/
+(void)submitorderWithRequestURL:(NSString *)URLString
                     pragram:(NSDictionary *)pragram
                     success:(void (^)( NSDictionary* resultObject))success
                        fail:(void (^)( NSDictionary *errdic))fail
{
    
    __weak __block ASIHTTPRequest *Requestmanager = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:URLString]];
    NSData *bodydata =[[pragram JSONString] dataUsingEncoding:NSUTF8StringEncoding];
    [Requestmanager appendPostData:bodydata];
    [Requestmanager setCompletionBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
        NSData *data =[Requestmanager responseData];
        
        
        NSDictionary *dicinfo = [data objectFromJSONData];
        NSDictionary *dic1 = @{@"code":[NSNumber numberWithInt:Statuscode],@"responsedata":dicinfo};
        success(dic1);
    }];
    [Requestmanager setFailedBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
    }];
    [Requestmanager addRequestHeader:@"Content-Type" value:@"application/json"];
    [Requestmanager setDelegate:self];
    [Requestmanager setRequestMethod:@"POST"];
    [Requestmanager setTimeOutSeconds:6.f];
    [Requestmanager startAsynchronous];
}


















/************************
 
 登陆 login

 ************************/
+(void)LoginWithRequestURL1:(NSString *)URLString
                              pragram:(NSDictionary *)pragram
                              success:(void (^)( NSDictionary* resultObject))success
                                 fail:(void (^)( NSDictionary *errdic))fail
{
    
   __weak __block ASIFormDataRequest *Requestmanager = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:URLString]];
    
    if (pragram !=nil) {
        [pragram enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            [Requestmanager addPostValue:obj forKey:key];
        }];
    }
    
    [Requestmanager setCompletionBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
        NSData *data =[Requestmanager responseData];
        NSDictionary *dicinfo = [data objectFromJSONData];
        
        NSLog(@"%@",[dicinfo objectForKey:@"message"]);
        NSDictionary *dic1 = @{@"code":[NSNumber numberWithInt:Statuscode],@"responsedata":dicinfo};
        success(dic1);
    }];
    [Requestmanager setFailedBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
    }];
    [Requestmanager setBytesReceivedBlock:^(unsigned long long size, unsigned long long total) {
        
    }];
    [Requestmanager addRequestHeader:@"Content-Type" value:@"application/json"];
    [Requestmanager setDelegate:self];
    [Requestmanager setRequestMethod:@"POST"];
    [Requestmanager setTimeOutSeconds:6.f];
    [Requestmanager startAsynchronous];
}




/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}





@end
