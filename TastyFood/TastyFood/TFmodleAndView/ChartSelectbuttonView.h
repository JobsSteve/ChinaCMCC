//
//  ChartSelectbuttonView.h
//  TastyFood
//
//  Created by love_ping891122 on 14/12/18.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  ChartSelectbuttonViewDelegate<NSObject>

-(void)didselectChartSelectbuttonView:(int)indexButton;

@end

@interface ChartSelectbuttonView : UIView
{
    NSInteger selectIndex_Button;
}
@property(nonatomic,assign)NSInteger selectIndex_Button;
@property(nonatomic,retain)id<ChartSelectbuttonViewDelegate>delegate;
@end
