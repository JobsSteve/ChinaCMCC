//
//  DatePickerView.h
//  TastyFood
//
//  Created by love_ping891122 on 14/12/21.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerViewDelegate <NSObject>

-(void)didselectPickerView:(NSString*)string;

@end

@interface DatePickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSArray *dataSource1;
    NSArray *dataSource2;
    UIView *pickerview;
    
    NSInteger compment1Indexrow;
    NSInteger compment2Indexrow;


}
@property(nonatomic,strong)NSArray *dataSource1;
@property(nonatomic,strong)NSArray *dataSource2;

@property(nonatomic,strong)UIView *pickerview;


@property(nonatomic,assign)NSInteger compment1Indexrow;
@property(nonatomic,assign)NSInteger compment2Indexrow;


@property(nonatomic,assign)id<DatePickerViewDelegate> delegate ;


-(void)initShowpickerview:(NSArray *)source1 :(NSArray *)source2;
-(void)ShowPickView;
-(void)DismissPickView;
@end
