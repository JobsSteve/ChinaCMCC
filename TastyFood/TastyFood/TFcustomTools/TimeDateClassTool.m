//
//  TimeDateClassTool.m
//  IBM
//
//  Created by love_ping891122 on 14-8-20.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TimeDateClassTool.h"

@implementation TimeDateClassTool

//获取当前时间
+(NSString*)getCurrentDate
{
    /*******需要转化为GMT时区********/
    //NSTimeInterval timeZoneOffset=[[NSTimeZone systemTimeZone] secondsFromGMT];
    //NSDate * newDate=[[NSDate date] dateByAddingTimeInterval:timeZoneOffset];
    
    NSDateFormatter * formater=[[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyy-MM-dd"];
//    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formater stringFromDate:[NSDate date]];
}
//将时间转化字符串
+(NSString*)getStringFromDate:(NSDate*)datetemp
{
    NSDateFormatter * formater=[[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    return [formater stringFromDate:datetemp];
}

//获取相加天时间
+(NSDate*)getAddday:(NSDate*)timeTemp :(NSInteger)day
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:day];
    NSDate *date = [gregorian dateByAddingComponents:comps toDate:timeTemp  options:0];
    return date;
}













//显示yyyy/MM/dd HH:mm格式的数字

+(NSString*)getShowtimeSring:(NSString*)timestring
{
    NSDateFormatter * formater=[[NSDateFormatter alloc]init];
    [formater setDateFormat:@"yyyyMMddHHmm"];
    NSDate *date =[formater dateFromString:timestring];
//    [formater setDateFormat:@"yyyy/MM/dd HH:mm"];
    [formater setDateFormat:@"MM/dd HH:mm"];

    
    
    return  [formater stringFromDate:date];
}
//将字符串转化时间
+(NSDate*)getDateFromString:(NSString*)DateTimeString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    return  [dateFormatter dateFromString:DateTimeString];
    
}

//获取相加时间
+(NSDate*)getAddTime:(NSDate*)timeTemp :(NSInteger)hours
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setHour:hours];
    NSDate *date = [gregorian dateByAddingComponents:comps toDate:timeTemp  options:0];
    return date;
}
//获取相减时间
+(NSDate*)getReducingTime:(NSDate*)timeTemp :(NSInteger)setMinute
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMinute:(-setMinute)];
    NSDate *date = [gregorian dateByAddingComponents:comps toDate:timeTemp  options:0];
    return date;
}
//计算相差时间
+(NSInteger)CompareDateNum:(NSDate*)from_date :(NSDate*)to_date
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    //unsigned int unitDayFlags = NSDayCalendarUnit;  //年月日时分秒周从框架取出响应的参数
    unsigned int unitMinuteFlags = NSMinuteCalendarUnit;
    NSDateComponents *comps = [gregorian components:unitMinuteFlags fromDate:from_date  toDate:to_date  options:0];
    //NSInteger days = [comps day];
    //NSInteger hours = [comps hour];
    NSInteger minutes = [comps minute];
//    NSInteger second = [comps second];
    return minutes;

}

//时间大小的比较判断
+(BOOL)isDateCompare :(NSString *)dateone :(NSString*)datetwo
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    NSDate *date1 = [dateFormatter dateFromString:dateone];
    NSDate *date2 = [dateFormatter dateFromString:datetwo];
    switch ([date1 compare:date2])
    {
            
        case NSOrderedSame:
            return NO;
            break;
        case NSOrderedAscending:
            return YES;
            break;
            
        case NSOrderedDescending:
            return NO;
            break;
            
        default:
            return NO;
            break;
            
    }
}
//获取一个指定的时间
+(NSDate*)getaSetTime:(NSInteger)year :(NSInteger)month :(NSInteger)day :(NSInteger)hour :(NSInteger)minnute :(NSInteger)second
{
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:year];
    [comps setMonth:month];
    [comps setDay:day];
    [comps setHour:hour];
    [comps setMinute:minnute];
    [comps setSecond:second];
    NSDate *date = [gregorian dateFromComponents:comps];
    return date;
    
}



/********************************************/

//将字符串转化时间(带秒，服务器下发字段不带秒需要拼接00)
+(NSDate*)getDateFromStringwithSecond:(NSString*)DateTimeString
{
    NSString *stringtemp =[DateTimeString stringByAppendingString:@"00"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate *d =[dateFormatter dateFromString:stringtemp];
    
    return d ;
    
}
//计算相差时间（单位为秒）
+(NSInteger)CompareDateGetSecondNum:(NSDate*)from_date :(NSDate*)to_date
{
//    NSLog(@"%@",from_date);
//    NSLog(@"%@",to_date);
//    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitMinuteFlags = NSCalendarUnitSecond;
    NSDateComponents *comps = [gregorian components:unitMinuteFlags fromDate:from_date  toDate:to_date  options:0];
    NSInteger second = [comps second];
    return second;
}

@end
