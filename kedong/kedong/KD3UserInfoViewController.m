//
//  KD3UserInfoViewController.m
//  kedong
//
//  Created by apple on 14-8-8.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3UserInfoViewController.h"
#import "SFHFKeychainUtils.h"
#import "project.h"

@interface KD3UserInfoViewController ()

@end

@implementation KD3UserInfoViewController


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
    
    NSString *userName =[SFHFKeychainUtils getPasswordForUsername:USERNAME_KEY andServiceName:SERVICENAME error:nil];
    
    // Do any additional setup after loading the view.
    NSString *strUrl = [[NSString alloc] initWithFormat:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/UserinfoServlet?yhid=%@",userName];
    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *ret = [[NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",ret);
    
    NSArray *strArray = [ret componentsSeparatedByString:@","];

    NSLog(@"%@",[strArray objectAtIndex:0]);
    self.userName.text = [strArray objectAtIndex:0];
    self.userGroup.text = [strArray objectAtIndex:1];
    self.userCompany.text = [strArray objectAtIndex:2];
    self.userPlant.text = [strArray objectAtIndex:3];
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

@end
