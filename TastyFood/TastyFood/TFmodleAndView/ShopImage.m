//
//  ShopImage.m
//  TastyFood
//
//  Created by love_ping891122 on 15/1/5.
//  Copyright (c) 2015年 love_ping891122. All rights reserved.
//

#import "ShopImage.h"

@implementation ShopImage
@synthesize image1;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.image1 =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self addSubview:image1];
    
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)addAnimatedWithFrame:(CGPoint)startPoint :(CGPoint)endpoint{
//    
//    UIImageView *image1 =[UIImageView imageViewWithFrame:CGRectMake(0, 0, 40, 40):@"menu_2.png"];
//    [self addSubview:image1];
//    
    UIBezierPath *path = [UIBezierPath bezierPath];
    //动画起点
    [path moveToPoint:startPoint];
    //贝塞尔曲线控制点
    float sx = startPoint.x;
    float sy = startPoint.y;
    float ex = endpoint.x;
    float ey = endpoint.y;
    float x = sx + (ex - sx) / 3;
    float y = sy + (ey - sy) * 0.5 - 400;
    CGPoint centerPoint=CGPointMake(x, y);
    [path addQuadCurveToPoint:endpoint controlPoint:centerPoint];
    
    //key frame animation to show the bezier path animation
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 0.8;
    animation.delegate = self;
    animation.autoreverses = NO;
    animation.delegate = self;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.layer addAnimation:animation forKey:@"buy"];
}

- (void)animationDidStart:(CAAnimation *)anim
{
    
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self removeFromSuperview];
}

@end
