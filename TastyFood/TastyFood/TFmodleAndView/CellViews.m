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
//    UIImageView *Pic_imageview = [UIImageView imageViewWithFrame:CGRectMake(10, 10, 80, 80) :nil];
    
    NSString *string_picurl =[NSString stringWithFormat:@"http://www.6meijia.com/static-content?contentPath=images/freshfood/%@&freshFoodId=%@",[detailInfo[@"picture"]  objectForKey:@"fileName"],detailInfo[@"id"]];
//    NSData *data =  [NSData dataWithContentsOfURL:[NSURL URLWithString:string_picurl]];
//    Pic_imageview.image =[UIImage imageWithData:data];
//    http://www.6meijia.com/static-content?contentPath=images/freshfood/10121945028758.png&freshFoodId=1527
//    [Pic_imageview setImageWithURL:[NSURL URLWithString:string_picurl] ];
//    Pic_imageview.tag = 202;

    
    EGOImageView *iage = [[EGOImageView alloc]initWithPlaceholderImage:nil delegate:nil];
    iage.imageURL = [NSURL URLWithString:string_picurl];
    iage.frame = CGRectMake(10, 10, 80, 80);
    iage.tag = 202;

   
    
    //商品名字
    UILabel *product_name = [UILabel LabelWithFrame:CGRectMake(100, 15, 200, 40) text:detailInfo[@"name"] color:[UIColor blackColor] font:14];
    product_name.numberOfLines = product_name.text.length>16?2:1;
    //商品价格
    UILabel *product_price = [UILabel LabelWithFrame:CGRectMake(100, 65, 60, 20) text:[NSString stringWithFormat:@"￥%.2f",[detailInfo[@"meijiaPrice"] floatValue]] color:YellowColor_APP font:14];
    
    //数量加减编辑
    
    TboxKit *box =  [[TboxKit alloc]initWithFrame:CGRectMake(170, 65, 80, 25)];
    box.tag = 204;
    [Cellview  addSubview:box];
    
    
    UIButton *jionShopchart = [UIButton ButtonWithFrame:CGRectMake(WIGHT-50, 60, 35, 35) Normal:[UIImage imageNamed:@"addshopchartbutton"] Select:[UIImage imageNamed:@"addshopchartbutton"] Title:nil];
   
    
    jionShopchart.tag = 201;
    
    
    [Cellview addSubview:iage];
    [Cellview addSubview:jionShopchart];
    [Cellview addSubview:product_name];
    [Cellview addSubview:product_price];
    
    

    
    return Cellview;

}


+(UIView *)CellViewWithShopchartlistpart:(NSDictionary*)detailInfo
{
    UIView * Cellview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 80) :[UIColor clearColor]];
    
    //商品图片
    
    
    NSString *string_picurl =[NSString stringWithFormat:@"http://www.6meijia.com/static-content?contentPath=images/freshfood/%@&freshFoodId=1527",[detailInfo[@"picture"]  objectForKey:@"fileName"]];
    
    EGOImageView *iage = [[EGOImageView alloc]initWithPlaceholderImage:nil delegate:nil];
    iage.imageURL = [NSURL URLWithString:string_picurl];
    iage.frame = CGRectMake(30, 5, 60, 60);
    iage.tag = 202;

    
    
    //商品名字
    UILabel *product_name = [UILabel LabelWithFrame:CGRectMake(120, 10, 200, 40) text:detailInfo[@"name"] color:[UIColor blackColor] font:14];
    product_name.numberOfLines = product_name.text.length>16?2:1;
    
    
    //商品价格
    UILabel *product_price = [UILabel LabelWithFrame:CGRectMake(120, 50, 80, 20) text:[NSString stringWithFormat:@"￥%.2f  ×",[detailInfo[@"meijiaPrice"] floatValue]] color:YellowColor_APP font:14];
    
    UITextField *pronumfield = [UITextField textFieldWithFrame:CGRectMake(200, 50, 30, 20) fieldTag:1 fieldFont:13 textColor:[UIColor grayColor] fieldtext:@"0"];
    pronumfield.layer.borderColor = [UIColor grayColor].CGColor;
    pronumfield.layer.borderWidth = 1;
    pronumfield.layer.cornerRadius = 3;
    
    
    
    UIButton *deleteShopButton = [UIButton ButtonWithFrame:CGRectMake(WIGHT-50, 40, 25, 25) Normal:[UIImage imageNamed:@"delete.png"] Select:[UIImage imageNamed:@"delete.png"] Title:@""];
    deleteShopButton.tag = 203;
    [Cellview addSubview:deleteShopButton];
    
    
    
    [Cellview addSubview:iage];
    [Cellview addSubview:product_name];
    [Cellview addSubview:product_price];
    [Cellview addSubview:pronumfield];
    
    return Cellview;
    
}


+(UIView *)CellViewWithmyOrderlist:(NSDictionary*)detailInfo
{
    
//    NSDictionary *shop_one =   [[detailInfo objectForKey:@"freshFoodOrder"] objectForKey:@"freshFoodOrderDetails"];
    NSString *shopname =  [detailInfo objectForKey:@"name"];
    NSString *totalPrice =   [detailInfo objectForKey:@"totalPrice"];
    NSDictionary *shopdetailinfo =    [detailInfo objectForKey:@"freshFood"];
    NSString     *shoppicture =   [[shopdetailinfo objectForKey:@"picture"] objectForKey:@"fileName"];
    NSString *string_picurl =[NSString stringWithFormat:@"http://www.6meijia.com/static-content?contentPath=images/freshfood/%@&freshFoodId=1527",shoppicture];
 
    
    UIView * Cellview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 80) :[UIColor clearColor]];
    
    //商品图片
//    UIImageView *Pic_imageview = [UIImageView imageViewWithFrame:CGRectMake(10, 10, 60, 60) :@"product_2.png"];
    EGOImageView *iage = [[EGOImageView alloc]initWithPlaceholderImage:nil delegate:nil];
    iage.imageURL = [NSURL URLWithString:string_picurl];
    iage.frame = CGRectMake(10, 10, 60, 60);
    iage.tag = 204;

    
    
    
    
    
    //商品名字
    UILabel *product_name = [UILabel LabelWithFrame:CGRectMake(80, 10, 200, 40) text:shopname color:[UIColor blackColor] font:14];
    product_name.numberOfLines = product_name.text.length>16?2:1;
    //商品价格
    UILabel *product_price = [UILabel LabelWithFrame:CGRectMake(80, 50, 150, 20) text:[NSString stringWithFormat:@"小计: ￥%@ 元",totalPrice] color:YellowColor_APP font:14];
//    UILabel *product_number = [UILabel LabelWithFrame:CGRectMake(160, 50, 30, 20) text:@"5" color:YellowColor_APP font:14];
    
    
    
    
    [Cellview addSubview:iage];
    [Cellview addSubview:product_name];
    [Cellview addSubview:product_price];
//    [Cellview addSubview:product_number];
    
    return Cellview;
    
}


@end
