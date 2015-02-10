//
//  TFshoppingcartViewController.m
//  TastyFood
//
//  Created by love_ping891122 on 14/12/10.
//  Copyright (c) 2014年 love_ping891122. All rights reserved.
//

#import "TFshoppingcartViewController.h"
#import "ChartSelectbuttonView.h"
#import "TFeditAddressViewController.h"
@interface TFshoppingcartViewController ()<UITextViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,DatePickerViewDelegate,ChartSelectbuttonViewDelegate>
{
    UITableView *tableview;
    DatePickerView *datePickerView;
    UITextField *telphoneTextField;
    UITextField *addressTextField;
    YLTextView *textview;
    NSString *sendDate_value;
    NSString *sendTime_value;
    NSMutableArray *dataSouerce;
    AFPopupView *successPopview;
    
    NSInteger dashangButtonIndex;
}
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)DatePickerView *datePickerView;
@property(nonatomic,strong)YLTextView *textview;
@property(nonatomic,strong)NSString *sendDate_value;
@property(nonatomic,strong)NSString *sendTime_value;
@property(nonatomic,strong)AFPopupView *successPopview;
@property(nonatomic,strong)NSMutableArray *dataSouerce;
@property(nonatomic,strong)UITextField *addressTextField;
@property(nonatomic,strong)UITextField *telphoneTextField;
@property(nonatomic,assign)NSInteger dashangButtonIndex;

@end

@implementation TFshoppingcartViewController
@synthesize tableview;
@synthesize datePickerView;
@synthesize sendTime_value;
@synthesize textview;
@synthesize successPopview;
@synthesize dataSouerce;
@synthesize addressTextField;
@synthesize telphoneTextField;
@synthesize dashangButtonIndex;
@synthesize sendDate_value;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"购物车";
        self.tabBarItem =  [self.tabBarItem initWithTitle:@"购物车" image:[UIImage imageNamed:@"tabbar_04.png"] selectedImage:[UIImage imageNamed:@"tabbar_04.png"]];
        self.dataSouerce = [NSMutableArray arrayWithCapacity:1];
        self.dashangButtonIndex = 0;
        self.sendDate_value = [[NSString alloc]init];
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self initdatepicker];

    [self loadtime];
    if (self.dataSouerce &&self.dataSouerce.count>0) {
        [self.dataSouerce removeAllObjects];
    }
    [self.dataSouerce addObjectsFromArray:GetDefaults(@"shopchartlist")];
    [self.tableview reloadData];
    

}
- (void)viewDidLoad {
    [super viewDidLoad];


    [self initnavigationItem];
    [self initsubview];
    [self initTableview];
    
}

//初始化弹出视图
-(void)initpopview:(NSString*)statuspic :(NSString*)numberstring{

    UIView *headerview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 150) :GreenColor_APP];
    
    UIImageView *iconiamge = [UIImageView imageViewWithFrame:CGRectMake(WIGHT/2-90, 50, 30, 30) :@"icon-success.gif"];
    UILabel *title = [UILabel LabelWithFrame:CGRectMake(WIGHT/2-50, 53, 100, 30) text:@"订购成功" color:GreenColor_APP font:18];
    title.font = [UIFont boldSystemFontOfSize:23];
    title.textAlignment = NSTextAlignmentCenter;
    
    UILabel *title1 = [UILabel LabelWithFrame:CGRectMake(0, 90, WIGHT, 30) text:@"我们将第一时间安排配送" color:GreenColor_APP font:18];
    title1.font = [UIFont boldSystemFontOfSize:20];
    title1.textAlignment = NSTextAlignmentCenter;
    
    
    UILabel *moneynumLabel = [UILabel LabelWithFrame:CGRectMake(WIGHT-110, 35, 40, 30) text:numberstring color:GreenColor_APP font:18];
    moneynumLabel.font = [UIFont boldSystemFontOfSize:20];
    moneynumLabel.textAlignment = NSTextAlignmentCenter;
    
    
    UIImageView *imageview = [UIImageView imageViewWithFrame:CGRectMake(0, 200, WIGHT, 150) :@"s1.jpg"];
    UIView *show_view = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, HEIGHT) :[UIColor whiteColor]];
    
    
    
    
//    [show_view addSubview:headerview];
    [show_view addSubview:iconiamge];
    [show_view addSubview:title];
    [show_view addSubview:title1];
    [show_view addSubview:imageview];
    if (numberstring&&numberstring.length>0) {
        [imageview addSubview:moneynumLabel];

    }
    self.successPopview =  [AFPopupView popupWithView:show_view];

}
-(void)initsubview{
    
    self.textview = [YLTextView placeholdtextViewWithFrame:CGRectMake(90, 5, 200, 60) viewTag:1 viewFont:13 textColor:[UIColor grayColor]];
    self.textview.placeholder = @"可以写下您的备注信息!\n 谢谢！";
    self.textview.returnKeyType = UIReturnKeyDone;
    self.textview.delegate = self;
    
    
    
    self.addressTextField = [UITextField textFieldWithFrame:CGRectMake(0, 0, WIGHT-150, 35) fieldTag:3 fieldFont:13 textColor:[UIColor blackColor] fieldtext:@""];
    self.addressTextField.borderStyle = UITextBorderStyleNone;
    self.addressTextField.textAlignment = NSTextAlignmentRight;
    self.addressTextField.placeholder = @"请补充详细地址";
    
    self.telphoneTextField = [UITextField textFieldWithFrame:CGRectMake(0, 0, WIGHT-150, 35) fieldTag:3 fieldFont:13 textColor:[UIColor blackColor] fieldtext:@""];
    self.telphoneTextField.borderStyle = UITextBorderStyleNone;
    self.telphoneTextField.textAlignment = NSTextAlignmentRight;
    self.telphoneTextField.placeholder = @"手机号码";
    
    if (GetDefaults(@"userinformation")) {
        self.telphoneTextField.text =   [[GetDefaults(@"userinformation") objectForKey:@"account"] objectForKey:@"loginMobile"];
    }
}
-(void)initTableview
{
    
    self.tableview = [UITableView tableViewWithFrame:CGRectMake(0, 0, WIGHT, self.view.frame.size.height-49-20) tag:2];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
    UIView *footview = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 200) :[UIColor clearColor]];
    
    self.tableview.tableFooterView = footview;
    
}

-(void)initdatepicker
{
    
    NSDateFormatter * formater=[[NSDateFormatter alloc]init];
    [formater setDateFormat:@"HH"];
    NSString *string = [formater stringFromDate:[NSDate date]];
    int time = [string intValue];
    
    
    self.datePickerView = [[DatePickerView alloc]initWithFrame:CGRectMake(0,200, WIGHT, 190)];
    self.datePickerView.delegate = self;
    if (time <= 9) {
        [self.datePickerView initShowpickerview:@[@"今天"]  : @[@"11:30前送到",@"17:30前送到"]];
    }else if (9<time && time<=15){
        [self.datePickerView initShowpickerview:@[@"今天"]  : @[@"17:30前送到"]];
    }else if (15<time)
    {
        [self.datePickerView initShowpickerview:@[@"明天",@"后天"]  : @[@"11:30前送到",@"17:30前送到"]];

    }


}

-(void)initnavigationItem
{
    UIButton *registButton=[UIButton ButtonWithFrame:CGRectMake(WIGHT-90, 0, 80, 35) Normal:[UIImage imageNamed:@"btn-submited.png"] Select:[UIImage imageNamed:@"btn-submited.png"] Title:nil];
    [registButton addTarget:self action:@selector(ClickBt_submitorderVC:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:registButton];
    
}
#pragma mark ---------TableViewDataSource And TableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 4;
    }
    return  self.dataSouerce.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==3) {
            return 70;
        }
        return 45;
    }
    return 80;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
       return  @"用户信息";
    }
    return @"订单信息";
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 80;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    if (section==0) {
        UIView *footView = [UIView ViewWithFrame:CGRectMake(0, 0, WIGHT, 80) :[UIColor clearColor]];
        
        UILabel *label = [UILabel LabelWithFrame:CGRectMake(10, 0, WIGHT-20, 30) text:@" 亲,美家小哥用心为您挑选食材，打个赏吧!" color:[UIColor whiteColor] font:15];
        label.backgroundColor = YellowColor_APP;
        label.layer.cornerRadius = 3;
        [footView addSubview:label];
        
        
        ChartSelectbuttonView *view = [[ChartSelectbuttonView alloc]initWithFrame:CGRectMake(0, 35, WIGHT, 35)];
        view.delegate = self;
        [footView addSubview:view];
        return footView;
        
    }
    return nil;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"CelebrityCheckTableCell";
    [tableView registerClass:[UITableViewCell class]forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.selectionStyle= UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        
    }

    NSArray *imagelist = @[@"mobileicon.png",@"clockicon.png",@"locationicon.png",@"chaticon.png"];
    if (indexPath.section==0) {
        cell.imageView.image = [UIImage imageNamed:imagelist[indexPath.row]];
        if (indexPath.row==0) {
            cell.textLabel.text =  @"手机号";
            
            cell.accessoryView = self.telphoneTextField;

            
            
        }
        if (indexPath.row==1) {
            cell.textLabel.text =  @"配送时间";
            if (self.sendTime_value&&[self.sendTime_value length]>0) {
                cell.detailTextLabel.text =self.sendTime_value;
            }
        }
        if (indexPath.row==2) {
            cell.textLabel.text =  @"服务地址";
           
            cell.accessoryView = self.addressTextField;
        }
        if (indexPath.row==3) {
            cell.textLabel.text =  @"备注";
            [cell.contentView addSubview:textview];
        }

        
    }
    if (indexPath.section==1) {
           [cell.contentView addSubview:[CellViews CellViewWithShopchartlistpart:[[self.dataSouerce objectAtIndex:indexPath.row] objectForKey:@"shopdetail"]]];
        
        UITextField *pronumfield = (UITextField*)[cell.contentView viewWithTag:1];
        pronumfield.delegate =  self;
        pronumfield.returnKeyType= UIReturnKeyDone;
        pronumfield.keyboardType = UIKeyboardTypeNumberPad;
        pronumfield.text =[NSString stringWithFormat:@"%ld",(long)[[[self.dataSouerce objectAtIndex:indexPath.row] objectForKey:@"shopNum"]integerValue]];
        [pronumfield bindData:@"indexrow" Value:[NSNumber numberWithInteger:indexPath.row]];
        
        UIButton *btn =(UIButton*)[cell.contentView viewWithTag:203];
        [btn addTarget:self action:@selector(deleteshopAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn bindData:@"indexpath" Value:[NSNumber numberWithInteger:indexPath.row]];
 
    }
    
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==1) {
          [self.datePickerView ShowPickView];
        }
        if (indexPath.row==0||indexPath.row==2) {
            TFeditAddressViewController *VC = [[TFeditAddressViewController alloc]init];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];

}
-(void)deleteshopAction:(UIButton*)button
{
    
    NSInteger num = [[button getData:@"indexpath"] integerValue];
    NSMutableArray *datasource_temp = [NSMutableArray arrayWithCapacity:1];
    [datasource_temp addObjectsFromArray:GetDefaults(@"shopchartlist")];
    [datasource_temp removeObjectAtIndex:num];
    self.dataSouerce = datasource_temp;
    SetDefaults(@"shopchartlist",datasource_temp);
    [self.tableview reloadData];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"checkshopchartBadge" object:nil];

}
#pragma mark - Touch事件
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textview resignFirstResponder];
}
#pragma mark - UITextFieldDelegate
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    
    
    [self.textview resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
   return  [self.textview resignFirstResponder];

}
#pragma mark -- textfield delegate
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSInteger row = [[textField getData:@"indexrow"] integerValue];
    NSNumber *shopNumber = [NSNumber numberWithInteger:[textField.text integerValue]];
    //购物车列表
    NSMutableArray *shopchatlist = [NSMutableArray arrayWithCapacity:1];
    [shopchatlist addObjectsFromArray:GetDefaults(@"shopchartlist")];
    //单个商品
    NSMutableDictionary *info = [NSMutableDictionary dictionaryWithObjectsAndKeys:shopNumber,@"shopNum",[[shopchatlist objectAtIndex:row] objectForKey:@"shopdetail"],@"shopdetail", nil];
    [shopchatlist replaceObjectAtIndex:row withObject:info];
    SetDefaults(@"shopchartlist",shopchatlist);
    NSLog(@"%@",GetDefaults(@"shopchartlist"));
}
#pragma mark -- picker delegate
-(void)didselectPickerView:(NSString*)string
{
     NSLog(@"%@",string);
     NSString *date_temp = [string substringWithRange:NSMakeRange(0, 2)];
//    
    if ([date_temp isEqual:@"今天"]) {
        self.sendDate_value = [TimeDateClassTool getCurrentDate];
    }else  if ([date_temp isEqual:@"明天"]) {
        self.sendDate_value = [TimeDateClassTool getStringFromDate:[TimeDateClassTool getAddday:[NSDate date] :1]];
    }else  if ([date_temp isEqual:@"后天"]) {
        self.sendDate_value = [TimeDateClassTool getStringFromDate:[TimeDateClassTool getAddday:[NSDate date] :2]];
    }else{ }
    
    
    self.sendTime_value = [string substringWithRange:NSMakeRange(2, string.length-2)];
    NSLog(@"%@",self.sendDate_value);
    NSLog(@"%@",self.sendTime_value);

    [self.tableview reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadtime
{
    [SVProgressHUD showWithStatus:@"时间计算中..."];
    [ASIHttpMangment getTimeinfoWithRequestURL:@"http://6meijia.com/request/getTimeJsonPost" pragram:nil success:^(NSDictionary *resultObject) {
        NSString *messgae = [resultObject objectForKey:@"responsetime"];
        [SVProgressHUD showSuccessWithStatus:messgae];
        [UIView animateWithDuration:3 animations:^{
            [SVProgressHUD dismiss];
            
        }];
    } fail:^(NSDictionary *errdic) {
        [SVProgressHUD showSuccessWithStatus:@"验证失败"];
        [UIView animateWithDuration:2 animations:^{
            [SVProgressHUD dismiss];
        }];
    }];
}
#pragma mark ----- 打赏代理
-(void)didselectChartSelectbuttonView:(NSInteger)indexButton
{
    if (indexButton==0) {
        dashangButtonIndex=0;
    }else
    {
        dashangButtonIndex++;

    }
    
}

//提交订单
-(void)ClickBt_submitorderVC:(UIButton*)btn
{
    
   
    
    
    
    NSMutableArray *shopchatlist_temp = [NSMutableArray arrayWithCapacity:1];
    [shopchatlist_temp addObjectsFromArray:GetDefaults(@"shopchartlist")];
    
    if (self.sendDate_value==nil||self.sendTime_value==nil||self.addressTextField.text==nil||self.textview.text==nil||GetDefaults(@"selectArea")==nil||shopchatlist_temp==nil||shopchatlist_temp.count==0) {
        [SVProgressHUD showSuccessWithStatus:@"请完善订单信息，再进行提交，谢谢！"];
        [UIView animateWithDuration:2 animations:^{
            [SVProgressHUD dismiss];
        }];
        return;
    }
    
    
    NSString *mobileNumber;
    if (GetDefaults(@"userinformation")) {
        mobileNumber =   [[GetDefaults(@"userinformation") objectForKey:@"account"] objectForKey:@"loginMobile"];
    }else
    {
        mobileNumber = self.telphoneTextField.text;
    }
    NSString *CommentString = self.textview.text;
    NSString *dataString = self.sendDate_value;
    NSString *timeString =  self.sendTime_value;
    NSString *areaString = GetDefaults(@"selectArea");
    NSString* area1 = [[areaString componentsSeparatedByString:@" "] objectAtIndex:0];
    NSString* area2 = [[areaString componentsSeparatedByString:@" "] objectAtIndex:1];
    NSString* detailaddress = self.addressTextField.text;
    
    NSMutableString *ordercontentString = [[NSMutableString alloc]init];
    float totalprice1 =0;//总价
    float totalweight1 =0;//总重量
    float totalsupplyprice1 =0;//供应闪价
    
    for (NSDictionary *dic in shopchatlist_temp) {
        NSString *string_temp2 = [NSString stringWithFormat:@"%@:%@:%@;",[dic[@"shopdetail"] objectForKey:@"id"],[dic[@"shopdetail"] objectForKey:@"name"] ,dic[@"shopNum"]];
        [ordercontentString appendString:string_temp2];
        
        float pricemeijia = [[dic[@"shopdetail"] objectForKey:@"meijiaPrice"] floatValue];//美家单价
        float pricesupplyjia = [[dic[@"shopdetail"] objectForKey:@"supplierPrice"] floatValue];//供应闪单价
        float weight = [[dic[@"shopdetail"] objectForKey:@"weight"] floatValue];//重量
        int totaltemp_weight = weight*[dic[@"shopNum"] floatValue];
        float total_price = pricemeijia*totaltemp_weight;
        float total_supplyprice = pricesupplyjia*totaltemp_weight;
        totalprice1=total_price+totalprice1;
        totalweight1 =totalweight1+totaltemp_weight;
        totalsupplyprice1 = total_supplyprice +totalsupplyprice1;
    }
    float totalmeijiaprice1 = totalprice1 - dashangButtonIndex ;//总美家价=总价-奖励
    float totalProcurementPrice = 0;//始终为0
    float bonusPrice = dashangButtonIndex;//奖励
    
    
    NSMutableArray *freshFoodOrderDetails = [NSMutableArray arrayWithCapacity:1];
    
    
    NSMutableDictionary *dic_one = [NSMutableDictionary dictionaryWithCapacity:1];
    
    for (NSDictionary *dic in shopchatlist_temp) {
        [dic_one setObject:[dic[@"shopdetail"] objectForKey:@"name"] forKey:@"name"];
        
        float pricemeijia_one = [[dic[@"shopdetail"] objectForKey:@"meijiaPrice"] floatValue];//美家单价
        float pricesupplyjia_one = [[dic[@"shopdetail"] objectForKey:@"supplierPrice"] floatValue];//供应闪单价
        
        float weight_one = [[dic[@"shopdetail"] objectForKey:@"weight"] floatValue];//重量
        float totaltemp_weight_one = weight_one*[dic[@"shopNum"] floatValue];
        
        float total_price_one = pricemeijia_one*totaltemp_weight_one;
        float total_supplyprice_one = pricesupplyjia_one*totaltemp_weight_one;
        
        
        [dic_one setObject:[NSNumber numberWithFloat:total_supplyprice_one] forKey:@"supplierPrice"];
        [dic_one setObject:[NSNumber numberWithFloat:totaltemp_weight_one] forKey:@"totalWeight"];
        [dic_one setObject:[NSNumber numberWithFloat:total_price_one] forKey:@"totalPrice"];
        [dic_one setObject:[dic[@"shopdetail"] objectForKey:@"weight"] forKey:@"weight"];
        [dic_one setObject:@{@"id":[dic[@"shopdetail"] objectForKey:@"id"]} forKey:@"freshFood"];
        
        [freshFoodOrderDetails addObject:dic_one];
    }
    
    
    
    
    NSMutableDictionary *postdic = [NSMutableDictionary dictionaryWithCapacity:1];
    [postdic setObject:mobileNumber forKey:@"customerMobile"];
    [postdic setObject:CommentString forKey:@"comments"];
    [postdic setObject:dataString forKey:@"dateStr"];
    [postdic setObject:timeString forKey:@"timeStr"];
    [postdic setObject:@"scps" forKey:@"serviceType"];
    [postdic setObject:@"individual" forKey:@"customerType"];
    
    NSMutableDictionary *addressdic = [NSMutableDictionary dictionaryWithCapacity:1];
    [addressdic setObject:area1 forKey:@"city"];
    [addressdic setObject:area2 forKey:@"district"];
    [addressdic setObject:detailaddress forKey:@"address"];
    
    [postdic setObject:addressdic forKey:@"address"];
    NSMutableDictionary *freshFoodOrder = [NSMutableDictionary dictionaryWithCapacity:1];
    [freshFoodOrder setObject:ordercontentString forKey:@"orderContent"];
    [freshFoodOrder setObject:[NSNumber numberWithFloat:totalprice1] forKey:@"totalPrice"];
    [freshFoodOrder setObject:[NSNumber numberWithFloat:totalweight1] forKey:@"totalWieght"];
    [freshFoodOrder setObject:[NSNumber numberWithFloat:totalsupplyprice1] forKey:@"totalSupplyPrice"];
    [freshFoodOrder setObject:[NSNumber numberWithFloat:totalmeijiaprice1] forKey:@"totalMeijiaPrice"];
    [freshFoodOrder setObject:[NSNumber numberWithFloat:totalProcurementPrice] forKey:@"totalProcurementPrice"];
    [freshFoodOrder setObject:[NSNumber numberWithFloat:bonusPrice] forKey:@"bonusPrice"];
    [freshFoodOrder setObject:freshFoodOrderDetails forKey:@"freshFoodOrderDetails"];
    
    [postdic setObject:freshFoodOrder forKey:@"freshFoodOrder"];
    
    
    [self submitOrderRequest:postdic];
    //购物车列表
    
    

    [[NSNotificationCenter defaultCenter]postNotificationName:@"checkshopchartBadge" object:nil];
    
}
-(void)submitOrderRequest:(NSDictionary *)postdicinfo
{
    [SVProgressHUD showWithStatus:@"订单提交中..."];
    
    [ASIHttpMangment submitorderWithRequestURL:@"http://6meijia.com/request/createMobileJsonPost" pragram:postdicinfo success:^(NSDictionary *resultObject) {
        NSString *messgae = [[resultObject objectForKey:@"responsedata"] objectForKey:@"description"];
        [SVProgressHUD showSuccessWithStatus:messgae];
        [UIView animateWithDuration:3 animations:^{
            [SVProgressHUD dismiss];
        }];
        
        NSString *status = [[resultObject objectForKey:@"responsedata"] objectForKey:@"status"];//success

        if ([status isEqual:@"success"]) {
        NSString *oldstatus = [[resultObject objectForKey:@"responsedata"] objectForKey:@"result"];//是否第一次 new  数字 old2
        if ([oldstatus isEqual:@"new"]) {
            [self initpopview:@"s1.jpg":@""];
        }else if ([oldstatus isEqual:@"old2"]) {
            [self initpopview:@"s3.jpg":@"100"];
        }else{
            [self initpopview:@"s2.jpg":@"100"];
        }
    
        [self.successPopview show];
       [self performSelector:@selector(dismisspopview) withObject:nil afterDelay:3];
            SetDefaults(@"shopchartlist", nil);
            [self.dataSouerce removeAllObjects];
            [self.tableview reloadData];
           
        }
        
        

    } fail:^(NSDictionary *errdic) {
        [SVProgressHUD showSuccessWithStatus:@"提交失败"];
        [UIView animateWithDuration:2 animations:^{
            [SVProgressHUD dismiss];
        }];
    }];
    
    
}




//提示页面消失
-(void)dismisspopview
{
        [self.successPopview hide];
}


/*  例子
 
 {"customerMobile":"22233334444”,
 "comments":"22233334444”,
 dateStr":"2015-01-26”
 ,"timeStr":"17:30前送到”,
 "serviceType":"scps”,
 "customerType":”individual"
 ,"address":{"city":"上海","district":"长寿路区域","address":"22233334444”}
 
 
 
 ,"freshFoodOrder”:
 {"orderContent":"72:鲫鱼:1;    73:黑鱼（约1-2斤）:2;",          "totalPrice":"18.25","totalWieght":”750”
 ,"totalSupplyPrice":"13.5","totalMeijiaPrice":"16.25","totalProcurementPrice":"0","bonusPrice":”2”
 ,
 
 "freshFoodOrderDetails”:
 [{"name":"鲫鱼","price":"4.25","supplierPrice":"3.5","count":”1”，"totalWeight":"250","totalPrice":"4.25","weight":"250","freshFood":{"id":"72”}}
 
 ,{"name":"黑鱼（约1-2斤）","price":"6","supplierPrice":"5","count":”2","totalWeight":"500","totalPrice":"12","weight":"250","freshFood":{"id":"73"}}
 
 ]}}
 
 
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
