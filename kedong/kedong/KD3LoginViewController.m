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

@interface KD3LoginViewController ()

@end

@implementation KD3LoginViewController


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

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
    [NSThread sleepForTimeInterval:0];
    
    SSCheckBoxView * checkBoxA = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(2, 2, 101, 40) style:2 checked:NO];
    [checkBoxA setText:@"记住密码"];
    
    SSCheckBoxView *checkBoxB = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(2, 2, 101, 40) style:2 checked:NO];
    [checkBoxB setText:@"自动登录"];
    
    [self.checkAView addSubview: checkBoxA];
    [self.checkBView addSubview: checkBoxB];
    
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
