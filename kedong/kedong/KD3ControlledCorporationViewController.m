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

@property(strong, nonatomic) TWRChartView *oneDayChartView;
@property(strong, nonatomic) TWRChartView *oneMonthChartView;
@end

@implementation KD3ControlledCorporationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _oneDayChartView = [[TWRChartView alloc] initWithFrame:CGRectMake(0, 64, 300, 200)];
    
    _oneDayChartView.backgroundColor = [UIColor clearColor];
    
    
    [_oneDayLineChartUIView addSubview:_oneDayChartView];
    


    _oneMonthChartView = [[TWRChartView alloc] initWithFrame:CGRectMake(0, 64, 300, 200)];
//    
//    UILabel *labelToday = [[UILabel alloc] initWithFrame:CGRectMake(230, 10, 20, 20)];
//    labelToday.text = @"今";
//    [labelToday setTextColor:[UIColor blueColor]];
//    
//    UILabel *labelYestoday = [[UILabel alloc] initWithFrame:CGRectMake(260, 10, 20, 20)];
//    labelYestoday.text = @"昨";
//    [labelYestoday setTextColor:[UIColor redColor]];
    
    _oneMonthChartView.backgroundColor = [UIColor clearColor];
    [_oneMonthLineChartUIView addSubview:_oneMonthChartView];
    
//    [_oneMonthLineChartUIView addSubview:labelToday];
//    [_oneMonthLineChartUIView addSubview:labelYestoday];
    
    
    

}

- (void)viewWillAppear:(BOOL)animated
{
    
    NSInteger hourNum = 24;
    NSMutableArray *data1 = [[NSMutableArray alloc] initWithCapacity:hourNum];
    NSMutableArray *data2 = [[NSMutableArray alloc] initWithCapacity:hourNum];
    NSMutableArray *labels1 = [[NSMutableArray alloc] initWithCapacity:hourNum];
    for(int i=0; i<hourNum; i++)
    {
        [labels1 addObject:[[NSString alloc] initWithFormat:@"%d", i+1]];
        [data1 addObject:[NSNumber numberWithInt:20 + arc4random()%50]];
        [data2 addObject:[NSNumber numberWithInt:30 + arc4random()%60]];
        
    }
    NSArray *arr1 = [[NSArray alloc] initWithArray:data1];
    NSArray *arr2 = [[NSArray alloc] initWithArray:data2];
    
    TWRDataSet *dataSet1 = [[TWRDataSet alloc] initWithDataPoints:arr1  fillColor:[UIColor clearColor] strokeColor:[UIColor blueColor]];
    TWRDataSet *dataSet2 = [[TWRDataSet alloc] initWithDataPoints:arr2  fillColor:[UIColor clearColor] strokeColor:[UIColor redColor]];
    
    TWRLineChart *line = [[TWRLineChart alloc] initWithLabels:labels1
                                                     dataSets:@[dataSet1,dataSet2]
                                                     animated:YES];
    
    [_oneDayChartView loadLineChart:line];
    

    
    
    NSInteger daysNum = 30;
    NSMutableArray *data3 = [[NSMutableArray alloc] initWithCapacity:daysNum];
    NSMutableArray *data4 = [[NSMutableArray alloc] initWithCapacity:daysNum];
    NSMutableArray *labels2 = [[NSMutableArray alloc] initWithCapacity:daysNum];
    for(int i=0; i<daysNum; i++)
    {
        [labels2 addObject:[[NSString alloc] initWithFormat:@"%d", i+1]];
        [data3 addObject:[NSNumber numberWithInt:100 + arc4random()%50]];
        [data4 addObject:[NSNumber numberWithInt:150 + arc4random()%30]];
        
    }
    NSArray* arr3 = [[NSArray alloc] initWithArray:data3];
    NSArray* arr4 = [[NSArray alloc] initWithArray:data4];
    
    TWRDataSet *dataSet3 = [[TWRDataSet alloc] initWithDataPoints:arr3 fillColor:[UIColor clearColor] strokeColor:[UIColor blueColor]];
    TWRDataSet *dataSet4 = [[TWRDataSet alloc] initWithDataPoints:arr4  fillColor:[UIColor clearColor] strokeColor:[UIColor redColor]];
    
    TWRLineChart *line1 = [[TWRLineChart alloc] initWithLabels:labels2
                                                      dataSets:@[dataSet3,dataSet4]
                                                      animated:YES];
    
    [_oneMonthChartView loadLineChart:line1];
    
    

    

    

}

- (void)viewDidAppear:(BOOL)animated
{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
