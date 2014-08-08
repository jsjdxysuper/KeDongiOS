//
//  KD3PowerPlantController.m
//  kedong
//
//  Created by apple on 14-7-29.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3PowerPlantController.h"
#import "KD3SettingViewController.h"

@interface KD3PowerPlantController ()

@end

@implementation KD3PowerPlantController

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
    
    self.webView1 = (UIWebView*)[self.view viewWithTag:1];
    if(nil != self.webView1){
        self.webView1.delegate = self;
        // Do any additional setup after loading the view.
        self.url1 = [NSURL URLWithString:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/dc.jsp?yhid=13940366736"];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.url1];
        [self.webView1 loadRequest:request];
        self.webView1.scalesPageToFit =YES;
        [self.view addSubview:self.webView1];
    }

    self.webView2 = (UIWebView*)[self.view viewWithTag:2];
    if(nil != self.webView2){
        self.webView2.delegate = self;
        // Do any additional setup after loading the view.
        self.url2 = [NSURL URLWithString:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/fgs.jsp?yhid=13940366736"];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.url2];
        [self.webView2 loadRequest:request];
        self.webView2.scalesPageToFit =YES;
        [self.view addSubview:self.webView2];
    }

    self.webView3 = (UIWebView*)[self.view viewWithTag:3];
    if(nil != self.webView3){
        self.webView3.delegate = self;
        // Do any additional setup after loading the view.
        self.url3 = [NSURL URLWithString:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/jzzt.jsp?yhid=13940366736"];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.url3];
        [self.webView3 loadRequest:request];
        self.webView3.scalesPageToFit =YES;
        [self.view addSubview:self.webView3];

    }
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]
                                 initWithTitle:@"设置"
                                 style:UIBarButtonItemStylePlain
                                 target:self                                 
                                 action:@selector(backView:)];
    
    [self.navigationItem setRightBarButtonItem:rightBtn];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]
                                 initWithTitle:@"刷新"
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                action:@selector(refreshData:)];
    
    [self.navigationItem setLeftBarButtonItem:leftBtn];
    self.navigationItem.title = @"电厂云图";
    
    
//    self.hidesBottomBarWhenPushed = NO;
    
}


- (void)refreshData:(id)sender
{
    NSURLRequest *request1 = [NSURLRequest requestWithURL:self.url1];
    [self.webView1 loadRequest:request1];
    
    NSURLRequest *request2 = [NSURLRequest requestWithURL:self.url2];
    [self.webView2 loadRequest:request2];
    
    NSURLRequest *request3 = [NSURLRequest requestWithURL:self.url3];
    [self.webView3 loadRequest:request3];
}

- (void)backView:(id)sender
{
    UIStoryboard *mainStoryboard = [UIStoryboard  storyboardWithName:@"Main" bundle:nil];
    UIViewController *settingViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"settingScene"];

    settingViewController.hidesBottomBarWhenPushed = YES;

        [self.navigationController pushViewController:settingViewController animated:YES];
    
    settingViewController.navigationItem.title = @"设置";
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
//    [self.navigationController set
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)viewDidDisappear:(BOOL)animated
{
    
    
//    [self.navigationController popToRootViewControllerAnimated:NO];
    [super viewDidDisappear:animated ];
    
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
