//
//  UITextView+BindArgs.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/14.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "UITextView+BindArgs.h"

@implementation UITextView (BindArgs)

+(instancetype)textViewWithFrame:(CGRect)frame viewTag:(NSInteger)tag viewFont:(CGFloat)font textColor:(UIColor*)tcolor
{
    UITextView *textview = [[UITextView alloc]initWithFrame:frame];
    textview.backgroundColor = [UIColor clearColor];
    textview.tag = tag;
    textview.font = [UIFont systemFontOfSize:font];
    textview.textColor = tcolor;
    return textview;
}
@end
