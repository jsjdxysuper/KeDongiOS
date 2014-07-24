//
//  KD3PowerPlant1ViewController.h
//  kedong
//
//  Created by apple on 14-7-24.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EColumnChart.h"

@interface KD3PowerPlantViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,
    EColumnChartDelegate, EColumnChartDataSource>

@property (strong, nonatomic) EColumnChart *eColumnChart;
@end
