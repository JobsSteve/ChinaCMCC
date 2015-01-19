//
//  ASIHttpMangment.m
//  IBM
//
//  Created by love_ping891122 on 14-5-27.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "ASIHttpMangment.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation ASIHttpMangment



/************************
 
 登陆 login

 ************************/
+(void)LoginWithRequestURL:(NSString *)URLString
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
        NSLog(@"返回数据:%@",dic1);
        success(dic1);
    }];
    [Requestmanager setFailedBlock:^{
      
    }];
    [Requestmanager setBytesReceivedBlock:^(unsigned long long size, unsigned long long total) {
        
    }];
    [Requestmanager setDelegate:self];
    [Requestmanager setRequestMethod:@"POST"];
    [Requestmanager setTimeOutSeconds:5.f];
    [Requestmanager startAsynchronous];
}



/************************
 
  商品数据
 
 ************************/

+(void)ShoplistWithRequestURL:(NSString *)URLString
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
        NSLog(@"返回数据:%@",dic1);
        success(dic1);
    }];
    [Requestmanager setFailedBlock:^{
        
    }];
    [Requestmanager setBytesReceivedBlock:^(unsigned long long size, unsigned long long total) {
    }];
    [Requestmanager setDelegate:self];
    [Requestmanager setRequestMethod:@"POST"];
    [Requestmanager setTimeOutSeconds:5.f];
    [Requestmanager startAsynchronous];
    
    
}








@end
