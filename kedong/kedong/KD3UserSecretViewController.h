//
//  KD3UserSecretViewController.h
//  kedong
//
//  Created by apple on 14-8-8.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KD3UserSecretViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *oSecret;
@property (weak, nonatomic) IBOutlet UITextField *nSecret;
@property (weak, nonatomic) IBOutlet UITextField *confirm;

- (IBAction)OKButton:(id)sender;

@end
