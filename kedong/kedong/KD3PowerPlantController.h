//
//  KD3PowerPlantController.h
//  kedong
//
//  Created by apple on 14-7-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EColumnChart.h"

@interface KD3PowerPlantController : UITableViewController
    <UITableViewDataSource, UITableViewDelegate,
    EColumnChartDelegate, EColumnChartDataSource>

@property (strong, nonatomic) EColumnChart *eColumnChart;

@end
