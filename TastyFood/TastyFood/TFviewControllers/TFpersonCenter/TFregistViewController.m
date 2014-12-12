//
//  TFregistViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/9.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFregistViewController.h"

@interface TFregistViewController ()<UITextFieldDelegate>
{
    UITextField *_usernameField;
    UITextField *_passwordField;
    UITextField *_comfirpasswordField;

    BOOL _isloading;//正在加载
    
}
@property(nonatomic,retain)UITextField *_usernameField;
@property(nonatomic,retain)UITextField *_passwordField;

@property(nonatomic,retain)UITextField *_comfirpasswordField;


@end

@implementation TFregistViewController
@synthesize _usernameField,_passwordField;
@synthesize _comfirpasswordField;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"注册";
        
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView_ForLogin];
    // Do any additional setup after loading the view.
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
        
  
        
        
        
        
        //登录密码
        _comfirpasswordField=[[UITextField alloc]initWithFrame:CGRectMake(30, 150, WIGHT-60, 35)];
        _comfirpasswordField.borderStyle = UITextBorderStyleRoundedRect;
        _comfirpasswordField.placeholder=@"密码";
        _comfirpasswordField.tag=2;
        _comfirpasswordField.delegate=self;
        _comfirpasswordField.clearButtonMode=UITextFieldViewModeWhileEditing;
        _comfirpasswordField.textColor = RGBAcolor(37, 156, 200,1);
        _comfirpasswordField.textColor = [UIColor blackColor];
        _comfirpasswordField.textAlignment = NSTextAlignmentLeft;
        _comfirpasswordField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        _comfirpasswordField.returnKeyType=UIReturnKeyDone;
        _comfirpasswordField.clearButtonMode=UITextFieldViewModeWhileEditing;
        _comfirpasswordField.secureTextEntry=YES;
        _comfirpasswordField.text=@"123456";
        _comfirpasswordField.font=[UIFont systemFontOfSize:15];
        [self.view addSubview:_comfirpasswordField];
        
        
        
        UIView *leftvw3=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        leftvw3.backgroundColor=[UIColor clearColor];
        UIImageView *lefview3=[[UIImageView alloc]initWithFrame:CGRectMake(9, 8, 22, 24)];
        lefview3.image=[UIImage imageNamed:@"password@2x.png"];
        [leftvw3 addSubview:lefview3];
        _comfirpasswordField.leftView=leftvw3;
        _comfirpasswordField.leftViewMode=UITextFieldViewModeAlways;
        
        
        
        
       
        
        //登录按钮
        UIButton *loginbt=[UIButton ButtonWithFrame:CGRectMake(30, 220, WIGHT-30*2, 35) Normal:[UIImage imageNamed:@"loginbtn_image.png"] Select:[UIImage imageNamed:@"loginbtn_image.png"] Title:@"提交"];
        loginbt.backgroundColor = RGBAcolor(255, 157, 7, 1);
        [loginbt addTarget:self action:@selector(ClickBt_submit:) forControlEvents:UIControlEventTouchUpInside];
        [self .view addSubview:loginbt];
        
        
        
    }
}
-(void)ClickBt_submit:(id)sender
{
    
    [_usernameField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_comfirpasswordField resignFirstResponder];

    if (_isloading)  return;
    if (_usernameField.text.length==0||_passwordField.text.length==0||_comfirpasswordField.text.length==0||![_comfirpasswordField.text isEqualToString:_passwordField.text]) {
        return;
    }
    _isloading=YES;
    
 
    [self request_Username:_usernameField.text Pwd:_passwordField.text];
}

-(void)request_Username:(NSString *)username Pwd:(NSString *)pwd
{
    _isloading=NO;
    
    SetDefaults(Defaults_LoginName, username);
    SetDefaults(Defaults_LoginPsw, pwd);
    SetDefaults(Defaults_Loginbool, [NSNumber numberWithBool:YES]);
    
    
    
}
#pragma mark - Touch事件
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_usernameField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_comfirpasswordField resignFirstResponder];

}
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
