//
//  DatePickerView.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/21.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "DatePickerView.h"

@implementation DatePickerView
@synthesize dataSource2;
@synthesize dataSource1;
@synthesize pickerview;
@synthesize compment1Indexrow;
@synthesize compment2Indexrow;


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
//        [self initpickerview:frame];
        
        
        
    }
    return self;
}
-(void)initShowpickerview:(NSArray *)source1 :(NSArray *)source2
{
    
    self.dataSource1 = source1;
    self.dataSource2 = source2;
    
    NSArray  *windows = [UIApplication sharedApplication].windows;
    UIWindow *window = [windows objectAtIndex:0];
    CGSize windowSize = window.rootViewController.view.bounds.size;
    
    pickerview = [[UIView alloc]initWithFrame:CGRectMake(0, windowSize.height-190, WIGHT, 190)];
    pickerview.backgroundColor = [UIColor whiteColor];
    
    UIPickerView *pickerivew =[[UIPickerView alloc]initWithFrame:CGRectMake(0, 40, WIGHT, 40)];
    pickerivew.delegate = self;
    pickerivew.dataSource = self;
    [pickerview addSubview:pickerivew];
    
    
    UIView *statusView = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 40) :GreenColor_APP];
    
    
    UIButton *cancelButton  = [UIButton ButtonWithFrame:CGRectMake(10, 5, 50, 30) Normal:nil Select:nil Title:@"取消"];
    [cancelButton addTarget:self action:@selector(PickerDidselectCancelbutton:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.layer.cornerRadius = 2;
    cancelButton.layer.borderColor = [UIColor whiteColor].CGColor;
    cancelButton.layer.borderWidth = 1;
    
    UIButton *okButton  = [UIButton ButtonWithFrame:CGRectMake(WIGHT-60, 5, 50, 30) Normal:nil Select:nil Title:@"确定"];
    [okButton addTarget:self action:@selector(PickerDidselectOkbutton:) forControlEvents:UIControlEventTouchUpInside];
    okButton.layer.cornerRadius = 2;
    okButton.layer.borderColor = [UIColor whiteColor].CGColor;
    okButton.layer.borderWidth = 1;

    [statusView addSubview:cancelButton];
    [statusView addSubview:okButton];
    
    
    
    [pickerview addSubview:statusView];
    
    [window addSubview:pickerview];
    [self DismissPickView];
    
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0){
        return self.dataSource1.count;
    }
    return self.dataSource2.count;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==0) {
        return self.dataSource1[row];
    }
    return self.dataSource2[row];
    
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0) {
        
        self.compment1Indexrow = row;
    }else if (component==1){
        self.compment2Indexrow = row;
    }

}
-(void)PickerDidselectCancelbutton:(UIButton*)btn
{
    [self DismissPickView];

}
-(void)PickerDidselectOkbutton:(UIButton*)btn
{

    [self DismissPickView];
    
    NSString *value_string =  [NSString stringWithFormat:@"%@ %@",dataSource1[self.compment1Indexrow],dataSource2[self.compment2Indexrow]];
    [self.delegate didselectPickerView:value_string];
    
    
}

- (void)ShowPickView
{
    
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionOverrideInheritedDuration animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    NSArray  *windows = [UIApplication sharedApplication].windows;
    UIWindow *window = [windows objectAtIndex:0];
    CGSize windowSize = window.rootViewController.view.bounds.size;
    pickerview.frame = CGRectMake(0, windowSize.height-190, WIGHT, 190);
    
}
- (void)DismissPickView
{
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionOverrideInheritedDuration animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    NSArray  *windows = [UIApplication sharedApplication].windows;
    UIWindow *window = [windows objectAtIndex:0];
    CGSize windowSize = window.rootViewController.view.bounds.size;
    pickerview.frame = CGRectMake(0, windowSize.height, WIGHT, 190);

}

@end
