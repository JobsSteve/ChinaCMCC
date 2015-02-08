//
//  TimeDateClassTool.h
//  IBM
//
//  Created by love_ping891122 on 14-8-20.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

/*************
 
时间日期处理工具类

**************/


#import <Foundation/Foundation.h>

@interface TimeDateClassTool : NSObject


//获取当前时间字符串
+(NSString*)getCurrentDate;
//加天数
+(NSDate*)getAddday:(NSDate*)timeTemp :(NSInteger)day;
//将时间转化字符串
+(NSString*)getStringFromDate:(NSDate*)datetemp;












//显示yyyy/MM/dd HH:mm格式的数字
+(NSString*)getShowtimeSring:(NSString*)timestring;
//时间大小的比较判断
+(BOOL)isDateCompare :(NSString *)dateone :(NSString*)datetwo;
//获取相加时间
+(NSDate*)getAddTime:(NSDate*)timeTemp :(NSInteger)hours;

//获取相减时间
+(NSDate*)getReducingTime:(NSDate*)timeTemp :(NSInteger)setMinute;

//比较相差时间
+(NSInteger)CompareDateNum:(NSDate*)from_date :(NSDate*)to_date;
//将字符串转化时间
+(NSDate*)getDateFromString:(NSString*)DateTimeString;
//将时间转化字符串
+(NSString*)getStringFromDate:(NSDate*)datetemp;



/********************************************/

//将字符串转化时间(带秒，服务器下发字段不带秒需要拼接00)
+(NSDate*)getDateFromStringwithSecond:(NSString*)DateTimeString;
//计算相差时间（单位为秒）
+(NSInteger)CompareDateGetSecondNum:(NSDate*)from_date :(NSDate*)to_date;

@end
