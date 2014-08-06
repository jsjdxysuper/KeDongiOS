//
//  KD3LoginViewController.m
//  kedong
//
//  Created by apple on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3LoginViewController.h"
#import "SSCheckBoxView.h"


@interface KD3LoginViewController ()

@end

@implementation KD3LoginViewController


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
@end
