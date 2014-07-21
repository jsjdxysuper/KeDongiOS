//
//  KD3FirstViewController.m
//  kedong
//
//  Created by apple on 14-7-17.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "KD3ControlledCorporationViewController.h"
#import "TWRChartView.h"
#import "TWRDataSet.h"
#import "TWRLineChart.h"

@interface KD3ControlledCorporationViewController ()

@property(strong, nonatomic) TWRChartView *chartView;
@end

@implementation KD3ControlledCorporationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _chartView = [[TWRChartView alloc] initWithFrame:CGRectMake(0, 64, 320, 300)];

    _chartView.backgroundColor = [UIColor clearColor];


    [self.view addSubview:_chartView];
    


    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSMutableArray *data1 = [[NSMutableArray alloc] initWithCapacity:24];
    NSMutableArray *data2 = [[NSMutableArray alloc] initWithCapacity:24];
    NSMutableArray *labels = [[NSMutableArray alloc] initWithCapacity:24];
    for(int i=0; i<24; i++)
    {
        [labels addObject:[[NSString alloc] initWithFormat:@"%d", i+1]];
        [data1 addObject:[NSNumber numberWithInt:20 + arc4random()%50]];
        [data2 addObject:[NSNumber numberWithInt:30 + arc4random()%60]];
        
    }
    NSArray *arr1 = [[NSArray alloc] initWithArray:data1];
    NSArray *arr2 = [[NSArray alloc] initWithArray:data2];
    
    TWRDataSet *dataSet2 = [[TWRDataSet alloc] initWithDataPoints:arr1  fillColor:[UIColor clearColor] strokeColor:[UIColor blueColor]];
    TWRDataSet *dataSet3 = [[TWRDataSet alloc] initWithDataPoints:arr2  fillColor:[UIColor clearColor] strokeColor:[UIColor greenColor]];
    
    TWRLineChart *line = [[TWRLineChart alloc] initWithLabels:labels
                                                     dataSets:@[dataSet2,dataSet3]
                                                     animated:YES];
    
    [_chartView loadLineChart:line];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
