//
//  TFloginViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/9.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFloginViewController.h"
#import "TFregistViewController.h"
@interface TFloginViewController ()<UITextFieldDelegate>
{
    UITextField *_usernameField;
    UITextField *_passwordField;
    UIButton    *boxBt;
    BOOL _isloading;//正在加载
    
}
@property(nonatomic,retain)UITextField *_usernameField;
@property(nonatomic,retain)UITextField *_passwordField;
@property(nonatomic,retain)UIButton    *boxBt;


@end

@implementation TFloginViewController
@synthesize _usernameField,_passwordField;
@synthesize boxBt;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"登录";
        
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView_ForLogin];
    [self initnavigationItem];

}
-(void)initnavigationItem
{
    UIButton *registButton=[UIButton ButtonWithFrame:CGRectMake(WIGHT-60, 0, 50, 35) Normal:nil Select:nil Title:@"注册"];
    [registButton addTarget:self action:@selector(ClickBt_pushregistVC) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:registButton];

}

-(void)initView_ForLogin
{
    @autoreleasepool {
        
        
        UIImageView *backimagePic =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logonew.png"]];
        backimagePic.frame =CGRectMake(0, 20, 320, 200);
        [self.view addSubview:backimagePic];
        
        
        
        //用户名
        _usernameField=[[UITextField alloc]initWithFrame:CGRectMake(30, 50, WIGHT-60, 35)];
        _usernameField.borderStyle = UITextBorderStyleRoundedRect;
        _usernameField.font=[UIFont systemFontOfSize:15];
        _usernameField.returnKeyType=UIReturnKeyDone;
        _usernameField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        _usernameField.textAlignment = NSTextAlignmentLeft;
        _usernameField.clearButtonMode=UITextFieldViewModeWhileEditing;
        _usernameField.textColor = RGBAcolor(37, 156, 200,1);
        _usernameField.textColor = [UIColor blackColor];
        _usernameField.tag=1;
        _usernameField.delegate=self;
        _usernameField.placeholder=@"用户名/手机号";
        _usernameField.text=@"TST0002";
        [self.view addSubview:_usernameField];
        
        
        UIView *leftvw=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        leftvw.backgroundColor=[UIColor clearColor];
        UIImageView *lefview=[[UIImageView alloc]initWithFrame:CGRectMake(9, 8, 22, 24)];
        lefview.image=[UIImage imageNamed:@"username@2x.png"];
        [leftvw addSubview:lefview];
        _usernameField.leftView=leftvw;
        _usernameField.leftViewMode=UITextFieldViewModeAlways;
        
        
        //登录密码
        _passwordField=[[UITextField alloc]initWithFrame:CGRectMake(30, 100, WIGHT-60, 35)];
        _passwordField.borderStyle = UITextBorderStyleRoundedRect;
        _passwordField.placeholder=@"密码";
        _passwordField.tag=2;
        _passwordField.delegate=self;
        _passwordField.clearButtonMode=UITextFieldViewModeWhileEditing;
        _passwordField.textColor = RGBAcolor(37, 156, 200,1);
        _passwordField.textColor = [UIColor blackColor];
        _passwordField.textAlignment = NSTextAlignmentLeft;
        _passwordField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        _passwordField.returnKeyType=UIReturnKeyDone;
        _passwordField.clearButtonMode=UITextFieldViewModeWhileEditing;
        _passwordField.secureTextEntry=YES;
        _passwordField.text=@"123456";
        _passwordField.font=[UIFont systemFontOfSize:15];
        [self.view addSubview:_passwordField];
        
        
        
        UIView *leftvw2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        leftvw2.backgroundColor=[UIColor clearColor];
        UIImageView *lefview2=[[UIImageView alloc]initWithFrame:CGRectMake(9, 8, 22, 24)];
        lefview2.image=[UIImage imageNamed:@"password@2x.png"];
        [leftvw2 addSubview:lefview2];
        _passwordField.leftView=leftvw2;
        _passwordField.leftViewMode=UITextFieldViewModeAlways;
        
        //复选按钮
        GetDefaults(Defaults_isRememberPsw);
        NSString *boxBt_imagename = [GetDefaults(Defaults_isRememberPsw) boolValue]?@"icnbox_ok.png":@"icnbox_no.png";
        
        boxBt=[UIButton ButtonWithFrame:CGRectMake(WIGHT-100, 150, 20, 20) Normal:[UIImage imageNamed:boxBt_imagename] Select:[UIImage imageNamed:boxBt_imagename] Title:nil];
        [boxBt addTarget:self action:@selector(ClickBt_boxBt:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:boxBt];
        
        
        
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(WIGHT-80, 150, 50, 25)];
        lable.backgroundColor = [UIColor clearColor];
        lable.text = @"自动登录";
        lable.textAlignment = NSTextAlignmentRight;
        lable.font = [UIFont systemFontOfSize:12];
        lable.textColor = [UIColor grayColor];
        [self.view addSubview:lable];
        
        //登录按钮
        UIButton *loginbt=[UIButton ButtonWithFrame:CGRectMake(30, 220, WIGHT-30*2, 35) Normal:[UIImage imageNamed:@"loginbtn_image.png"] Select:[UIImage imageNamed:@"loginbtn_image.png"] Title:@"登录"];
        loginbt.backgroundColor = RGBAcolor(255, 157, 7, 1);
        [loginbt addTarget:self action:@selector(ClickBt_Login:) forControlEvents:UIControlEventTouchUpInside];
        [self .view addSubview:loginbt];
        
        
        
    }
}



#pragma mark - button事件
-(void)ClickBt_boxBt:(id)sender
{
    NSLog(@"%@",GetDefaults(Defaults_isRememberPsw));
    
    if ([GetDefaults(Defaults_isRememberPsw) boolValue]==YES) {
        SetDefaults(Defaults_isRememberPsw,@NO);
        [boxBt setBackgroundImage:[UIImage imageNamed:@"icnbox_no.png"] forState:UIControlStateNormal];
        return;

    }
    SetDefaults(Defaults_isRememberPsw,@YES);
    [boxBt setBackgroundImage:[UIImage imageNamed:@"icnbox_ok.png"] forState:UIControlStateNormal];

}

-(void)ClickBt_Login:(id)sender
{
    
    if (_isloading)  return;
    if (_usernameField.text.length==0||_passwordField.text.length==0) {
     
        return;
    }
    _isloading=YES;
    
    [_usernameField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [self request_Username:_usernameField.text Pwd:_passwordField.text];
}
-(void)request_Username:(NSString *)username Pwd:(NSString *)pwd
{
    _isloading = NO;

    SetDefaults(Defaults_LoginName, username);
    SetDefaults(Defaults_LoginPsw, pwd);
    SetDefaults(Defaults_Loginbool, [NSNumber numberWithBool:YES]);
   
    
    
}
#pragma mark - Touch事件
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_usernameField resignFirstResponder];
    [_passwordField resignFirstResponder];
}
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)ClickBt_pushregistVC
{
    TFregistViewController *VC= [[TFregistViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
