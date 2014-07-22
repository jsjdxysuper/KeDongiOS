//
//  KD3PowerUnitViewController.m
//  kedong
//
//  Created by apple on 14-7-17.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3PowerUnitViewController.h"
#import "LDProgressView.h"

@interface KD3PowerUnitViewController ()

@end

@implementation KD3PowerUnitViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 220, self.view.frame.size.width-40, 22)];
    //    progressView.showText = @NO;
    progressView.progress = 0.40;
    progressView.borderRadius = @5;
    progressView.type = LDProgressSolid;
//    [self.progressViews addObject:progressView];
    [self.view addSubview:progressView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
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

@end
