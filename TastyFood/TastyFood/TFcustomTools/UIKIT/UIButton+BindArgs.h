//
//  UIButton+BindArgs.h
//  EastAxe
//
//  Created by SunSet on 13-12-26.
//  Copyright (c) 2013年 SunSet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BindArgs)

/*设置网络图片*/
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder Zip:(BOOL)iszip;

/*根据键值绑定数据*/
-(void)bindData:(NSString *)key Value:(id)value;
/*根据键值获取绑定的数据*/
-(id)getData:(NSString *)key;
/*移除数据绑定*/
-(void)removeData;

/*生成一个包含frame，背景色和标题的按钮*/
+(instancetype)ButtonWithFrame:(CGRect)frame Normal:(UIImage *)normal Select:(UIImage *)select Title:(NSString *)title;
/*生成一个包含frame，左图片,背景色和标题的按钮*/

+(instancetype)ButtonWithFrame:(CGRect)frame leftimage:(UIImage*)smallImage Normal:(UIImage *)normal Select:(UIImage *)select rightTitle:(NSString *)title;

/*生成一个包含frame，上图片,下文字，适合tabbar背景和标题的按钮*/

+(instancetype)ButtonWithFrame:(CGRect)frame topNormalimage:(UIImage*)NormalImage topSlectimage:(UIImage *)SlectImage Title:(NSString *)title titleColor:(UIColor*)titlecolor ;

@end
