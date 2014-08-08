//
//  KD3TabBarController.m
//  kedong
//
//  Created by apple on 14-8-8.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3TabBarController.h"

@interface KD3TabBarController ()

@end

@implementation KD3TabBarController

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
    NSLog(@"load");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"dis");
    [super viewDidDisappear:animated];
}

//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
//{
//    NSLog(@"%@", viewController);
//    NSLog(@"akdfjkl");
//}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
//    static NSString *status;
//    
//    NSLog(@"akdfjkl");
////    [self.navigationController popToRootViewControllerAnimated:NO];
////    self.hidesBottomBarWhenPushed  = YES;
//    
//    status = item.title;
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
