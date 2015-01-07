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
 
 参数:username password
 
 
 ************************/
+(void)LoginWithRequestURL:(NSString *)URLString
                              pragram:(NSMutableDictionary *)pragram
                              success:(void (^)( NSDictionary* resultObject))success
                                 fail:(void (^)( NSDictionary *errdic))fail
{
    
    __block ASIFormDataRequest *Requestmanager = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:URLString]];
//    [Requestmanager setStringEncoding:NSUTF8StringEncoding];
    [Requestmanager setCompletionBlock:^{
        int Statuscode= [Requestmanager responseStatusCode];
        NSLog(@"---Request Statuscode = %d",Statuscode);
        NSDictionary *dic1 = @{@"code":[NSNumber numberWithInt:Statuscode]};
        success(dic1);
    }];
    [Requestmanager setFailedBlock:^{
        
        int Statuscode= [Requestmanager responseStatusCode];
        NSLog(@"%@",Requestmanager.responseStatusMessage);
        NSLog(@"%d",Statuscode);
        NSLog(@"%@",Requestmanager.responseString);
        NSDictionary *dic1 = @{@"code":[NSNumber numberWithInt:Requestmanager.responseStatusCode ],@"reason":(Requestmanager.responseString==nil?@"request error":Requestmanager.responseString)};
        fail(dic1);

    }];
    
    [Requestmanager setBytesReceivedBlock:^(unsigned long long size, unsigned long long total) {
        
    }];
    [Requestmanager setDelegate:self];
    [Requestmanager setRequestMethod:@"POST"];
    [Requestmanager setTimeOutSeconds:5.f];
    [Requestmanager startAsynchronous];
}












@end
