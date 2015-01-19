//
//  CellViews.m
//  Copyright (c) 2014年 SunSet. All rights reserved.
//

#import "CellViews.h"
#import "UIImageView+WebCache.h"
#import "TboxKit.h"
@interface CellViews()<EGOImageViewDelegate>
@end

@implementation CellViews

+(UIView *)CellViewWithShoplist:(NSDictionary*)detailInfo
{
    UIView * Cellview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 100) :[UIColor clearColor]];

//商品图片
    UIImageView *Pic_imageview = [UIImageView imageViewWithFrame:CGRectMake(10, 10, 80, 80) :@"product_2.png"];
   [Pic_imageview setImageWithURL:[NSURL URLWithString:detailInfo[@"shoppic"]] placeholderImage:[UIImage imageNamed:@"product_2.png"]];
    
    
    
    
    
    //商品名字
    UILabel *product_name = [UILabel LabelWithFrame:CGRectMake(100, 15, 200, 40) text:detailInfo[@"shopname"] color:[UIColor blackColor] font:14];
    product_name.numberOfLines = product_name.text.length>16?2:1;
    //商品价格
    UILabel *product_price = [UILabel LabelWithFrame:CGRectMake(100, 65, 60, 20) text:detailInfo[@"shopprice"] color:YellowColor_APP font:14];
    
    
    
    //数量加减编辑
    [Cellview  addSubview:[[TboxKit alloc]initWithFrame:CGRectMake(170, 65, 80, 25)]];
    
    
    
    UIButton *jionShopchart = [UIButton ButtonWithFrame:CGRectMake(WIGHT-60, 30, 30, 30) Normal:[UIImage imageNamed:@"shapchart.png"] Select:[UIImage imageNamed:@"shapchart.png"] Title:nil];
   
    
    jionShopchart.tag = 201;
    [Cellview addSubview:jionShopchart];
    
    
    
    [Cellview addSubview:Pic_imageview];
    [Cellview addSubview:product_name];
    [Cellview addSubview:product_price];
    
    return Cellview;

}


+(UIView *)CellViewWithShopchartlistpart:(NSDictionary*)detailInfo
{
    UIView * Cellview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 80) :[UIColor clearColor]];
    
    //商品图片
    UIImageView *Pic_imageview = [UIImageView imageViewWithFrame:CGRectMake(10, 5, 60, 60) :@"product_2.png"];
    //商品名字
    UILabel *product_name = [UILabel LabelWithFrame:CGRectMake(80, 10, 200, 40) text:@"广东菜心(现实促销)" color:[UIColor blackColor] font:14];
    product_name.numberOfLines = product_name.text.length>16?2:1;
    //商品价格
    UILabel *product_price = [UILabel LabelWithFrame:CGRectMake(80, 50, 80, 20) text:@"¥100.00 ×" color:YellowColor_APP font:14];
    UITextField *pronumfield = [UITextField textFieldWithFrame:CGRectMake(160, 50, 30, 20) fieldTag:1 fieldFont:13 textColor:[UIColor grayColor] fieldtext:@"11"];
    pronumfield.layer.borderColor = [UIColor grayColor].CGColor;
    pronumfield.layer.borderWidth = 1;
    pronumfield.layer.cornerRadius = 3;
    
    
    
    UIButton *deleteShopButton = [UIButton ButtonWithFrame:CGRectMake(270, 25, 30, 30) Normal:[UIImage imageNamed:@"delete.png"] Select:[UIImage imageNamed:@"delete.png"] Title:@""];
    deleteShopButton.tag = 203;
    [Cellview addSubview:deleteShopButton];
    
    
    
    [Cellview addSubview:Pic_imageview];
    [Cellview addSubview:product_name];
    [Cellview addSubview:product_price];
    [Cellview addSubview:pronumfield];
    
    return Cellview;
    
}


+(UIView *)CellViewWithmyOrderlist:(NSDictionary*)detailInfo
{
    UIView * Cellview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 80) :[UIColor clearColor]];
    

    //标签
    
    
    
    //商品图片
    UIImageView *Pic_imageview = [UIImageView imageViewWithFrame:CGRectMake(10, 10, 60, 60) :@"product_2.png"];
    //商品名字
    UILabel *product_name = [UILabel LabelWithFrame:CGRectMake(80, 10, 200, 40) text:@"广东菜心(现实促销)" color:[UIColor blackColor] font:14];
    product_name.numberOfLines = product_name.text.length>16?2:1;
    //商品价格
    UILabel *product_price = [UILabel LabelWithFrame:CGRectMake(80, 50, 80, 20) text:@"¥100.00 ×" color:YellowColor_APP font:14];
    UILabel *product_number = [UILabel LabelWithFrame:CGRectMake(160, 50, 30, 20) text:@"5" color:YellowColor_APP font:14];
    
    
    
    
    [Cellview addSubview:Pic_imageview];
    [Cellview addSubview:product_name];
    [Cellview addSubview:product_price];
    [Cellview addSubview:product_number];
    
    return Cellview;
    
}

@end
