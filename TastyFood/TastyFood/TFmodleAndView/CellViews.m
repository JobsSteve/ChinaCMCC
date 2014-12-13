//
//  CellViews.m
//  Copyright (c) 2014年 SunSet. All rights reserved.
//

#import "CellViews.h"
#import "UIImageView+WebCache.h"

@interface CellViews()
@end

@implementation CellViews

+(UIView *)CellViewWithShoplist:(NSDictionary*)detailInfo
{
    UIView * Cellview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 100) :[UIColor clearColor]];

    UIImageView *Pic_imageview = [UIImageView imageViewWithFrame:CGRectMake(10, 10, 80, 80) :@"product_2.png"];
    
    UILabel *product_name = [UILabel LabelWithFrame:CGRectMake(100, 15, 200, 20) text:@"广东菜心" color:[UIColor blackColor] font:14];
    
    UILabel *product_price = [UILabel LabelWithFrame:CGRectMake(100, 65, 200, 20) text:@"¥100.00" color:[UIColor yellowColor] font:14];
    
    
    
    [Cellview addSubview:Pic_imageview];
    [Cellview addSubview:product_name];
    [Cellview addSubview:product_price];
    
    return Cellview;

}



@end
