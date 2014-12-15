//
//  TboxKit.h
//  TastyFood
//
//  Created by love_ping891122 on 14/12/13.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  TboxKitViewDelegate<NSObject>

-(void)getinfo:(int)index;


@end
//宽度80,高度:25

@interface TboxKit : UIView
@property(nonatomic,strong)UILabel  *shopNumLabel;
@property(nonatomic,assign)NSInteger shopNumber;


@property(nonatomic,assign)id <TboxKitViewDelegate>delegate;

@end
