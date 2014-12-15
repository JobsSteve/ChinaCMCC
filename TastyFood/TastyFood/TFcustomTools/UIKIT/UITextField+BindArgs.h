//
//  UITextField+BindArgs.h
//  TastyFood
//
//  Created by love_ping891122 on 14/12/14.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (BindArgs)
+(instancetype)textFieldWithFrame:(CGRect)frame fieldTag:(NSInteger)tag fieldFont:(CGFloat)font textColor:(UIColor*)tcolor fieldtext:(NSString*)textstring;

@end
