//
//  UITextField+BindArgs.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/14.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "UITextField+BindArgs.h"

@implementation UITextField (BindArgs)
+(instancetype)textFieldWithFrame:(CGRect)frame fieldTag:(NSInteger)tag fieldFont:(CGFloat)font textColor:(UIColor*)tcolor fieldtext:(NSString*)textstring
{
    //用户名
    UITextField*  textField=[[UITextField alloc]initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:font];
    textField.returnKeyType= UIReturnKeyDone;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.textColor = tcolor;
    textField.tag = tag;
    textField.text= textstring;
    
    
    
    return textField;
    
    
}

@end
