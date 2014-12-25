//
//  UIButton+BindArgs.m
//  EastAxe
//
//  Created by SunSet on 13-12-26.
//  Copyright (c) 2013年 SunSet. All rights reserved.
//

#import "UIButton+BindArgs.h"
#import <objc/runtime.h>
#import "NSURLRequest+NSURLRequestWithIgnoreSSL.h"

@implementation UIButton (BindArgs)


-(void)bindData:(NSString *)key Value:(id)value
{
    objc_setAssociatedObject(self, [key cStringUsingEncoding:30], value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);


}
-(id)getData:(NSString *)key
{
    return objc_getAssociatedObject(self, [key cStringUsingEncoding:30]);
    
}
-(void)removeData
{
    objc_removeAssociatedObjects(self);
}

+(instancetype)ButtonWithFrame:(CGRect)frame Normal:(UIImage *)normal Select:(UIImage *)select Title:(NSString *)title
{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    [bt setFrame:frame];
    if (title) {
        [bt setTitle:title forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    if (normal) {
        [bt setBackgroundImage:normal forState:UIControlStateNormal];
    }
    if (select) {
        [bt setBackgroundImage:select forState:UIControlStateSelected];
        [bt setBackgroundImage:select forState:UIControlStateHighlighted];
    }
    return bt;
   
    
}

+(instancetype)ButtonWithFrame:(CGRect)frame leftimage:(UIImage*)smallImage Normal:(UIImage *)normal Select:(UIImage *)select rightTitle:(NSString *)title
{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
    [bt setFrame:frame];
    if (title) {
        [bt setTitle:title forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    if (smallImage) {
        [bt setImage:smallImage forState:UIControlStateNormal];
        [bt setImage:smallImage forState:UIControlStateSelected];

        [bt setImageEdgeInsets:UIEdgeInsetsMake(5, 10, 5, frame.size.width-40)];

    }
    if (normal) {
        [bt setBackgroundImage:normal forState:UIControlStateNormal];
    }
    if (select) {
        [bt setBackgroundImage:select forState:UIControlStateSelected];
        [bt setBackgroundImage:select forState:UIControlStateHighlighted];

    }
    return bt;
    
    
}

+(instancetype)ButtonWithFrame:(CGRect)frame topNormalimage:(UIImage*)NormalImage topSlectimage:(UIImage *)SlectImage Title:(NSString *)title titleColor:(UIColor*)titlecolor
{
    UIButton *bt=[UIButton buttonWithType:UIButtonTypeCustom];
                 [bt setFrame:frame];
    

        [bt setTitleColor:titlecolor forState:UIControlStateNormal];
        bt.titleLabel.font = [UIFont systemFontOfSize:13];
        bt.titleLabel.textAlignment =  NSTextAlignmentCenter;
        [bt setTitle:title forState:UIControlStateNormal];

    float  x_temp = -20;
    if (isiPhone6_Wight) {
        x_temp = -15;
    }else if (isiPhone6P_Wight){
        x_temp = -10;
    }
    
        [bt setTitleEdgeInsets:UIEdgeInsetsMake(15, x_temp, 0, 0)];

    if (NormalImage) {
        [bt setImage:NormalImage forState:UIControlStateNormal];
        [bt setImageEdgeInsets:UIEdgeInsetsMake(-10, WIGHT/4/2-20, 20, 0)];
        

    }
    if (SlectImage) {
        [bt setBackgroundImage:SlectImage forState:UIControlStateNormal];
        [bt setImageEdgeInsets:UIEdgeInsetsMake(-10, WIGHT/4/2, 20, 0)];

    }
    
    return bt;
    
    
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder Zip:(BOOL)iszip
{
    @synchronized(self){
        UIView * backbottom=[[UIView alloc]initWithFrame:self.bounds];
//        backbottom.backgroundColor=RGBColor(212, 212, 212);
        [self addSubview:backbottom];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSString *imagepathDir=[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/ImagesCache"];
            NSString * urlstr=[url description];
            NSString *imagename=[[urlstr componentsSeparatedByString:@" /"] lastObject]?[[urlstr componentsSeparatedByString:@"/"] lastObject]:@"1.png";
            NSString *imagepath=[imagepathDir stringByAppendingPathComponent:imagename];
            
            BOOL _isReload=NO;//是否重新加载
            if (![[NSFileManager defaultManager] fileExistsAtPath:imagepath]) {
                _isReload=YES;
            }
            else{
                if ([[[NSFileManager defaultManager] attributesOfItemAtPath:imagepath error:nil] fileSize]==0) {//如果存入的文件大小为0
                    _isReload=YES;
                    [[NSFileManager defaultManager] removeItemAtPath:imagepath error:nil];
                }
            }
            
            if (_isReload) {
                NSURL *url=[NSURL URLWithString:urlstr];
                //绕过https验证
                [NSURLRequest allowsAnyHTTPSCertificateForHost:urlstr];
                
                NSURLRequest *request=[NSURLRequest requestWithURL:url];
                NSHTTPURLResponse *response=nil;
                NSError *error=nil;
                NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
                if (response.statusCode==200&&!error) {
                    //输出流存储操作
                    NSOutputStream *output=[[NSOutputStream alloc]initToFileAtPath:imagepath append:NO];
                    //NSAssert([output hasSpaceAvailable], @"图片缓存内容无法被写入");//抛出宏
                    [output open];
                    uint8_t * byte=(uint8_t *)[data bytes];
                    [output write:byte maxLength:[data length]];
                    [output close];
                }
            }
            
            id orignimage=nil;
            orignimage=[[UIImage alloc]initWithContentsOfFile:imagepath];
            
            UIImage *img=[orignimage isKindOfClass:[UIImage class]]?orignimage:placeholder;
            if (iszip) {
                
                //需要压缩的话
                CGSize size=self.frame.size;
                CGRect rect=CGRectMake(0, 0, size.width*2, size.height*2);
                UIGraphicsBeginImageContext(rect.size);
                [img drawInRect:rect];
                img=UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
        }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [backbottom removeFromSuperview];
                
                if ([img isEqual:placeholder]) {//图片存在的话
                    self.userInteractionEnabled=NO;
                }
                [self setBackgroundImage:img forState:UIControlStateNormal];

            });
        });
    }
}

-(CGRect)convertSameSize:(CGSize)imagesize
{
    if (imagesize.width>imagesize.height) {
        float x = (imagesize.width-imagesize.height)/2;
        return CGRectMake(x, 0, imagesize.height, imagesize.height);
    }
    float y=(imagesize.height-imagesize.width)/2;
    return CGRectMake(0, y, imagesize.width, imagesize.width);
}


@end

