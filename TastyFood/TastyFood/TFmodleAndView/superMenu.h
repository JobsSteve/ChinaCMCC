//
//  superMenu.h
//  TastyFood
//
//  Created by love_ping891122 on 15/1/7.
//  Copyright (c) 2015年 love_ping891122. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol  superMenuViewDelegate<NSObject>

-(void)didselectChartSelectbuttonView:(NSInteger)indexButton;

@end;

@interface superMenu : UIView{
    
    NSInteger selectIndex_Button;
}
@property(nonatomic,assign)NSInteger selectIndex_Button;
@property(nonatomic,retain)id<superMenuViewDelegate>delegate;

@end
