//
//  KD3PowerPlantController.m
//  kedong
//
//  Created by apple on 14-7-29.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3PowerPlantController.h"

@interface KD3PowerPlantController ()

@end

@implementation KD3PowerPlantController

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
    
    UIWebView* webView1 = (UIWebView*)[self.view viewWithTag:1];
    if(nil != webView1){
        webView1.delegate = self;
        // Do any additional setup after loading the view.
        NSURL *url = [NSURL URLWithString:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/dc.jsp?yhid=13940366736"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView1 loadRequest:request];
        webView1.scalesPageToFit =YES;
        [self.view addSubview:webView1];
    }

    UIWebView* webView2 = (UIWebView*)[self.view viewWithTag:2];
    if(nil != webView2){
        webView2.delegate = self;
        // Do any additional setup after loading the view.
        NSURL *url = [NSURL URLWithString:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/fgs.jsp?yhid=13940366736"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView2 loadRequest:request];
        webView2.scalesPageToFit =YES;
        [self.view addSubview:webView2];
    }

    UIWebView* webView3 = (UIWebView*)[self.view viewWithTag:3];
    if(nil != webView3){
        webView3.delegate = self;
        // Do any additional setup after loading the view.
        NSURL *url = [NSURL URLWithString:@"http://www.sgepm.com/PlantCloudAtlasAppWebpub/jzzt.jsp?yhid=13940366736"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView3 loadRequest:request];
        webView3.scalesPageToFit =YES;
        [self.view addSubview:webView3];

    }

    
    
    
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
