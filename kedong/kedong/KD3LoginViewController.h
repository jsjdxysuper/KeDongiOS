//
//  KD3LoginViewController.h
//  kedong
//
//  Created by apple on 14-7-22.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCheckBoxView.h"
#import "project.h"

#define CHECKED @"1"
#define UNCKECKED @"0"



@interface KD3LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)textFieldDoneEditing:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *checkAView;
@property (weak, nonatomic) IBOutlet UIView *checkBView;

- (IBAction)loginButtondown:(id)sender;

@property (strong,nonatomic)SSCheckBoxView *checkBoxRemPass;
@property (strong,nonatomic)SSCheckBoxView *checkBoxAutoLogin;
@property (nonatomic)BOOL remPassCheck;
@property (nonatomic)BOOL autoLoginCheck;


@end
