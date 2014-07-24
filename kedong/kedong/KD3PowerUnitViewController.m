//
//  KD3PowerUnitViewController.m
//  kedong
//
//  Created by apple on 14-7-17.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3PowerUnitViewController.h"
#import "LDProgressView.h"
#define PLANTNUM    7

@interface KD3PowerUnitViewController ()

@property (strong,nonatomic) NSMutableArray *unitState;
@property (copy, nonatomic) NSArray *images;
@property (strong, nonatomic)NSArray *stateNum;
@property (strong, nonatomic)NSMutableArray *plantPower;
@property (strong, nonatomic)NSMutableArray *cities;
@end

@implementation KD3PowerUnitViewController

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
    
    
    _images = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"green-ball.png"],
     [UIImage imageNamed:@"blue-ball.png"],
     [UIImage imageNamed:@"orange-ball.png"],
     [UIImage imageNamed:@"red-ball.pgn"],nil];
    
    _unitState = [[NSMutableArray alloc]initWithCapacity:7];
    
    NSArray *plant = [[NSArray alloc]initWithObjects:@0, @1, @2, nil];
    [_unitState addObject:plant];
    
    for(int i=1; i< PLANTNUM - 1; i++)
    {
        plant = [[NSArray alloc] initWithObjects:
                 [[NSNumber alloc] initWithInt:arc4random()%4],
                 [[NSNumber alloc] initWithInt:arc4random()%4],
                 [[NSNumber alloc] initWithInt:arc4random()%4],
                 [[NSNumber alloc] initWithInt:arc4random()%4],nil];
        [_unitState addObject:plant];
    }
    plant = [[NSArray alloc]initWithObjects:@2, @3, @0, nil];
    [_unitState addObject:plant];
    
    NSInteger green=0,blue= 0, orange= 0,red =0;
    for(int i=0; i< PLANTNUM; i++)
    {
        NSArray *temp = [_unitState objectAtIndex:i];
        for(int j=0; j< [temp count]; j++)
        {
            if(NSOrderedSame ==[@0 compare:[temp objectAtIndex:j]])
                green++;
            else if(NSOrderedSame ==[@1 compare:[temp objectAtIndex:j]])
                blue++;
            else if(NSOrderedSame ==[@2 compare:[temp objectAtIndex:j]])
                orange++;
            else if(NSOrderedSame ==[@3 compare:[temp objectAtIndex:j]])
                red++;
        }
    }
    _stateNum = [[NSArray alloc] initWithObjects:[[NSString alloc] initWithFormat:@"%ld",green],
     [[NSString alloc] initWithFormat:@"%ld",blue],
                 [[NSString alloc] initWithFormat:@"%ld",orange],
     [[NSString alloc] initWithFormat:@"%ld",red], nil];
    
    
    _plantPower = [[NSMutableArray alloc]initWithCapacity:PLANTNUM];
    
    for(int i=0; i< PLANTNUM; i++)
    {
        [_plantPower addObject:[NSNumber numberWithInteger:200+arc4random()%1000]];
    }
    _cities = [[NSMutableArray alloc]initWithCapacity:PLANTNUM];
    [_cities addObject:@"大连"];
    [_cities addObject:@"鞍山"];
    [_cities addObject:@"沈阳"];
    [_cities addObject:@"锦州"];
    [_cities addObject:@"铁岭"];
    [_cities addObject:@"抚顺"];
    [_cities addObject:@"本溪"];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_cities count]+1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = nil;
    UITableViewCell *cell = nil;
    NSInteger row = [indexPath row];
    if( 0 == row){
        identifier = @"sumTableCell";
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        UILabel *label1 = (UILabel*)[cell viewWithTag:1];
        UILabel *label2 = (UILabel*)[cell viewWithTag:2];
        UILabel *label3 = (UILabel*)[cell viewWithTag:3];
        UILabel *label4 = (UILabel*)[cell viewWithTag:4];
        label1.text = [_stateNum objectAtIndex:0];
        label2.text = [_stateNum objectAtIndex:1];
        label3.text = [_stateNum objectAtIndex:2];
        label4.text = [_stateNum objectAtIndex:3];
    }
    else {
        identifier = @"detailTableCell";
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        UILabel *labelCity = (UILabel*)[cell viewWithTag:5];
        UILabel *labelPower = (UILabel*)[cell viewWithTag:6];
        labelCity.text = [_cities objectAtIndex:row -1];
        labelPower.text = [(NSNumber*)[_plantPower objectAtIndex:row-1] stringValue];
        
        NSInteger offset = 22 + 15;
        NSInteger xBegin = 60;
        NSArray *thisPowerPlant = [_unitState objectAtIndex:row -1];
        NSArray *imageNameArr = [[NSArray alloc] initWithObjects:@"green-ball.png",@"blue-ball.png", @"orange-ball.png", @"red-ball.png", nil];
        for(int i=0; i<[thisPowerPlant count]; i++ )
        {
            UIImageView * tempUIImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xBegin+ i*offset, 11, 22, 22)];
            NSNumber *tempNum = [thisPowerPlant objectAtIndex:i];
        
            UIImage *tempImage = [UIImage imageNamed:[imageNameArr objectAtIndex:[tempNum intValue]]];
            [tempUIImageView setImage:tempImage];
            [cell addSubview:tempUIImageView];
        }
        
        
    }
    
    return cell;
    
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
