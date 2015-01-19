//
//  ShopImage.h
//  TastyFood
//
//  Created by love_ping891122 on 15/1/5.
//  Copyright (c) 2015年 love_ping891122. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopImage : UIView
{
    UIImage *image;
    
}
@property(nonatomic,strong)UIImage *image;

- (void)addAnimatedWithFrame:(CGPoint)startPoint :(CGPoint)endpoint;
@end
