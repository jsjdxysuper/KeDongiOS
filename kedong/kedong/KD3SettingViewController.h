//
//  KD3SettingViewController.h
//  kedong
//
//  Created by apple on 14-8-7.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACPButton.h"

@interface KD3SettingViewController : UIViewController
    <UITableViewDataSource, UITableViewDelegate>
- (IBAction)logoutButtonDown:(id)sender;

@property (weak, nonatomic) IBOutlet ACPButton *logoutButton;
@end
