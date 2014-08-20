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
        self.url1 = [NSURL URLWithString:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/fdxx.jsp?yhid=13940366736"];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.url1];
        [self.webView1 loadRequest:request];
        self.webView1.scalesPageToFit =YES;
        [self.view addSubview:self.webView1];
    }

    self.webView2 = (UIWebView*)[self.view viewWithTag:2];
    if(nil != self.webView2){
        self.webView2.delegate = self;
        // Do any additional setup after loading the view.
        self.url2 = [NSURL URLWithString:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/fdzl.jsp?yhid=13940366736"];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.url2];
        [self.webView2 loadRequest:request];
        self.webView2.scalesPageToFit =YES;
        [self.view addSubview:self.webView2];
    }

    self.webView3 = (UIWebView*)[self.view viewWithTag:3];
    if(nil != self.webView3){
        self.webView3.delegate = self;
        // Do any additional setup after loading the view.
        self.url3 = [NSURL URLWithString:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/fdtj.jsp?yhid=13940366736"];
        NSURLRequest *request = [NSURLRequest requestWithURL:self.url3];
        [self.webView3 loadRequest:request];
        self.webView3.scalesPageToFit =YES;
        [self.view addSubview:self.webView3];

    }
    
//    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]
//                                 initWithTitle:@"设置"
//                                 style:UIBarButtonItemStylePlain
//                                 target:self                                 
//                                 action:@selector(backView:)];
    UIImage* backImage1 = [UIImage imageNamed:@"set.png"];
    
    CGRect backframe1 = CGRectMake(0,0,50,60);
    
    UIButton* backButton1= [[UIButton alloc] initWithFrame:backframe1];
    
    [backButton1 setBackgroundImage:backImage1 forState:UIControlStateNormal];
    
    [backButton1 setTitle:@"" forState:UIControlStateNormal];
    
    backButton1.titleLabel.font=[UIFont systemFontOfSize:20];
    
    [backButton1 addTarget:self action:@selector(backView:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton1];
//    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    


    UIImage* backImage = [UIImage imageNamed:@"refresh.png"];
    
    CGRect backframe = CGRectMake(0,0,50,60);
    
    UIButton* backButton= [[UIButton alloc] initWithFrame:backframe];
    
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    
    [backButton setTitle:@"" forState:UIControlStateNormal];
    
    backButton.titleLabel.font=[UIFont systemFontOfSize:20];
    
    
    [backButton addTarget:self action:@selector(refreshData:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    
    //左侧的图片按钮
    UIImage* leftImage = [UIImage imageNamed:@"ti.png"];
    
    CGRect leftframe = CGRectMake(0,0,30,30);
    
    UIButton* leftButton= [[UIButton alloc] initWithFrame:leftframe];
    
    [leftButton setBackgroundImage:leftImage forState:UIControlStateNormal];
    
    [leftButton setTitle:@"" forState:UIControlStateNormal];
    
    leftButton.titleLabel.font=[UIFont systemFontOfSize:20];
    
    [leftButton addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithCustomView:leftButton];

    [leftButton setUserInteractionEnabled:NO];
    [self.navigationItem setLeftBarButtonItem:leftBtn];
    
    [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects: leftBarButtonItem,rightBarButtonItem,nil]];
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
