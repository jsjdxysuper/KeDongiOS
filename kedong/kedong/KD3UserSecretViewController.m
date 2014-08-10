//
//  KD3UserSecretViewController.m
//  kedong
//
//  Created by apple on 14-8-8.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3UserSecretViewController.h"
#import "SFHFKeychainUtils.h"
#import "ACPButton.h"
#import "project.h"

@interface KD3UserSecretViewController ()

@end

@implementation KD3UserSecretViewController


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
   
    //用户单击空白处，自动隐藏键盘
    [self.view endEditing:YES];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.confirmButton setStyleType:ACPButtonOK];
    [self.confirmButton setLabelTextColor:[UIColor whiteColor] highlightedColor:[UIColor redColor] disableColor:nil];
    [self.confirmButton setLabelFont:[UIFont fontWithName:@"Trebuchet MS" size:16]];
//    [self.confirmButton setStyle:[UIColor greenColor]  andBottomColor:[UIColor greenColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)OKButton:(id)sender {
    if([self.nSecret.text isEqualToString:@""] || [self.oSecret.text isEqualToString:@""] || [self.confirm.text isEqualToString:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Warning" message:@"密码不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.alertViewStyle=UIAlertViewStyleDefault;
        [alert show];
        return;
    }
    if(![self.nSecret.text isEqualToString:self.confirm.text])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Warning" message:PASSWORD_DISAGREE delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.alertViewStyle=UIAlertViewStyleDefault;
        [alert show];
        return;
    }
    
    //获得存储的用户名
    NSString *userName =[SFHFKeychainUtils getPasswordForUsername:USERNAME_KEY andServiceName:SERVICENAME error:nil];
    
    //修改密码的url
    NSString *strUrl = [[NSString alloc] initWithFormat:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/ChangepwServlet?yhid=%@&ymm=%@&xmm=%@",userName, self.oSecret.text, self.nSecret.text];

    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *ret = [[NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
    
    if([ret isEqualToString:@"1"])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Warning" message:MODIFY_PASSWORD_SUCCESS delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.alertViewStyle=UIAlertViewStyleDefault;
        [alert setDelegate:self];
        [alert show];
//        [self.navigationController popViewControllerAnimated:YES];
        
    }else
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Warning" message:OLD_PASSWORD_INCORRECT delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.alertViewStyle=UIAlertViewStyleDefault;
        [alert show];
    }
    
#ifdef DEBUG
    NSLog(@"修改密码处，用户名%@", userName);
    NSLog(@"修改密码的连接%@",strUrl);
#endif
    
}

#define mark UIAlertViewDelegate -

//弹出警告窗口的代理函数,修改密码成功返回设置页面,出现错误处的文本清空
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([alertView.message isEqualToString:MODIFY_PASSWORD_SUCCESS])
        [self.navigationController popViewControllerAnimated:YES];
    else if([alertView.message isEqualToString:OLD_PASSWORD_INCORRECT])
    {
        [self.oSecret setText:@""];
    }else if([alertView.message isEqualToString:PASSWORD_DISAGREE])
    {
        [self.nSecret setText:@""];
        [self.confirm setText:@""];
    }
}
@end
