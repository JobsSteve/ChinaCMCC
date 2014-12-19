//
//  TFhtmlViewController.h
//  TastyFood
//
//  Created by love_ping891122 on 14/12/16.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFhtmlViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView *HtmlWebView;
    NSString *htmltitleString;
    NSString *htmlurlString;
    
}
@property(nonatomic,retain)UIWebView *HtmlWebView;
@property(nonatomic,retain)NSString *htmltitleString;

@property(nonatomic,retain)NSString *htmlurlString;


@end
