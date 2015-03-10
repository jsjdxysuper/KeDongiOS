//
//  KD3PowerPlantController.h
//  kedong
//
//  Created by apple on 14-7-29.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KD3PowerPlantController : UIViewController
    <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView1;
@property (weak, nonatomic) IBOutlet UIWebView *webView2;
@property (weak, nonatomic) IBOutlet UIWebView *webView3;

@property (strong, nonatomic)NSURL *url1;
@property (strong, nonatomic)NSURL *url2;
@property (strong, nonatomic)NSURL *url3;
- (IBAction)backView:(id)sender;

//- (void)setTabBarHidden:(BOOL)hidden;
@end
