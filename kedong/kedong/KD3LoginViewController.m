//
//  KD3LoginViewController.m
//  kedong
//
//  Created by apple on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3LoginViewController.h"
#import "SSCheckBoxView.h"
#import "project.h"
#import "SFHFKeychainUtils.h"


@interface KD3LoginViewController ()



@end

@implementation KD3LoginViewController


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
   // [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"login.jpg"]]];
    [NSThread sleepForTimeInterval:0];
    
    self.checkBoxRemPass = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(2, 2, 101, 40) style:2 checked:NO];
    [self.checkBoxRemPass setText:@"记住密码"];
    
    self.checkBoxAutoLogin = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(2, 2, 101, 40) style:2 checked:NO];
    [self.checkBoxAutoLogin setText:@"自动登录"];
    
    [self.checkAView addSubview: self.checkBoxRemPass];
    [self.checkBView addSubview: self.checkBoxAutoLogin];
    

    
//    [SFHFKeychainUtils storeUsername:userKey andPassword:@"5555" forServiceName:serviceName updateExisting:YES error:nil];
//    NSString *passWord =  [SFHFKeychainUtils getPasswordForUsername:userKey andServiceName:serviceName error:nil];
//    NSLog(@"%@", passWord);
}


- (void)viewDidAppear:(BOOL)animated
{
    NSString *isAutoLogin = [SFHFKeychainUtils getPasswordForUsername:AUTO_LONGIN_CHECK andServiceName:SERVICENAME error:nil];
    
    
    NSLog(@"自动登录设置%@",isAutoLogin);
    if ([isAutoLogin isEqualToString:CHECKED])
        self.autoLoginCheck = YES;
    else
        self.autoLoginCheck = NO;
    
    NSString *isRemPass = [SFHFKeychainUtils getPasswordForUsername:REM_PASS_CHECK andServiceName:SERVICENAME error:nil];
    
    if ([isRemPass isEqualToString:CHECKED]){
        self.remPassCheck = YES;
        NSString *userName =[SFHFKeychainUtils getPasswordForUsername:USERNAME_KEY andServiceName:SERVICENAME error:nil];
        
        NSString *password =[SFHFKeychainUtils getPasswordForUsername:PASS_KEY andServiceName:SERVICENAME error:nil];
        
        [self.passwordTextField setText:password];
        [self.nameTextField setText:userName];
    }
    else
        self.remPassCheck = NO;
    
    if(self.autoLoginCheck)
        [self performSegueWithIdentifier:@"login2Tab" sender:self];
    
    if(self.remPassCheck)
        [self.checkBoxRemPass setChecked:YES];
    else
        [self.checkBoxRemPass setChecked:NO];
    
    
    
    [self.checkBoxAutoLogin setChecked:NO];
    
    [super viewDidAppear:animated];
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

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)loginButtondown:(id)sender{
    NSString *strUrl = [[NSString alloc] initWithFormat:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/LoginServlet?userid=%@&password=%@",self.nameTextField.text, self.passwordTextField.text];
    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *ret = [[NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    if ([ret isEqualToString:@"1"]) {

        
        //处理记住密码和自动登录部分
        [SFHFKeychainUtils storeUsername:REM_PASS_CHECK andPassword:(self.checkBoxRemPass.checked ? CHECKED:UNCKECKED) forServiceName:SERVICENAME updateExisting:YES error:nil];
        
        [SFHFKeychainUtils storeUsername:AUTO_LONGIN_CHECK andPassword:(self.checkBoxAutoLogin.checked ? CHECKED:UNCKECKED) forServiceName:SERVICENAME updateExisting:YES error:nil];
        
        if(self.checkBoxAutoLogin.checked || self.checkBoxRemPass.checked)
        {
            [SFHFKeychainUtils storeUsername:USERNAME_KEY andPassword:self.nameTextField.text forServiceName:SERVICENAME updateExisting:YES error:nil];
            
            [SFHFKeychainUtils storeUsername:PASS_KEY andPassword:self.passwordTextField.text forServiceName:SERVICENAME updateExisting:YES error:nil];
        }
        
        [self performSegueWithIdentifier:@"login2Tab" sender:self];

    }
    else if([ret isEqualToString:@"0"])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Warning" message:@"用户名或密码不正确,请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.alertViewStyle=UIAlertViewStyleDefault;
        [alert show];
    }
#ifdef DEBUG
    NSLog(@"%@",self.nameTextField.text);
    NSLog(@"%@",self.passwordTextField.text);
    NSLog(@"%@",strUrl);
    NSLog(@"ret = %@", ret);
#endif
    
    }
@end
