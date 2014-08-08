//
//  KD3UserSecretViewController.m
//  kedong
//
//  Created by apple on 14-8-8.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3UserSecretViewController.h"

@interface KD3UserSecretViewController ()

@end

@implementation KD3UserSecretViewController

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
    }
    if(![self.nSecret.text isEqualToString:self.confirm.text])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Warning" message:@"两次输入的密码不一致" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        alert.alertViewStyle=UIAlertViewStyleDefault;
        [alert show];
    }
}
@end
