//
//  KD3PowerPlantController.m
//  kedong
//
//  Created by apple on 14-7-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3PowerPlantController.h"
#import "LDProgressView.h"
#import "KD3CommonTools.h"

@interface KD3PowerPlantController ()
//NSString:serialNumber, NSArray:substract.
@property (strong, nonatomic) NSMutableDictionary *plantsSubstractDic;
//NSString:serialNumber, NSInteger:progress.
@property (strong, nonatomic) NSMutableDictionary *progressDic;
//NSString:serialNumber, NSInteger:diff.
@property (strong, nonatomic) NSMutableDictionary *progressDiffDic;

@property (strong, nonatomic) NSArray *colorsArray;
@end

@implementation KD3PowerPlantController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIColor colorWithRed:0.00f green:0.64f blue:0.00f alpha:1.00f];
    
    
    _plantsSubstractDic = [[NSMutableDictionary alloc] initWithCapacity:5];
    

    NSArray *substractArray = [[NSArray alloc] initWithObjects:@"45",@"35",@"52",@"47", nil];
    [_plantsSubstractDic setObject:substractArray forKey:@"大连"];
    substractArray = [[NSArray alloc] initWithObjects:@"45", @"65",@"62",@"47", nil];
    [_plantsSubstractDic setObject:substractArray forKey:@"鞍山"];
    substractArray = [[NSArray alloc] initWithObjects:@"45", @"35",@"72",@"57", nil];
    [_plantsSubstractDic setObject:substractArray forKey:@"盘锦"];
    substractArray = [[NSArray alloc] initWithObjects:@"45", @"53",@"32",@"41", nil];
    [_plantsSubstractDic setObject:substractArray forKey:@"辽阳"];
    substractArray = [[NSArray alloc] initWithObjects:@"44", @"32",@"52",@"49", nil];
    [_plantsSubstractDic setObject:substractArray forKey:@"锦州"];
    
    
    
    
    _progressDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                    [NSNumber numberWithFloat:40],@"大连",
                    [NSNumber numberWithFloat:43],@"鞍山",
                    [NSNumber numberWithFloat:65],@"盘锦",
                    [NSNumber numberWithFloat:54],@"辽阳",
                    [NSNumber numberWithFloat:29],@"锦州",nil];
    


    
    _progressDiffDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                        [NSNumber numberWithInt:12],@"大连",
                        [NSNumber numberWithInt:9],@"鞍山",
                        [NSNumber numberWithInt:-5],@"盘锦",
                        [NSNumber numberWithInt:3],@"辽阳",
                        [NSNumber numberWithInt:7],@"锦州",nil];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * ret;
    if(0 == section)
        ret = [[NSString alloc] initWithFormat:@"基本数据"];
    else if(1 == section)
        ret = [[NSString alloc] initWithFormat:@"计划完成率"];
    else
        ret = [[NSString alloc] initWithFormat:@"日历进度差"];
    return ret;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSInteger ret = 0;
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            ret = [_plantsSubstractDic count]+1;
            break;
        case 1:
            ret = [_progressDic count];
            break;
        default:
            //ret = [_progressDiffDic count];
            break;
    }
    return ret;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    NSString *identifier = nil;
    NSArray * keysArray;
    
    
    if( 0 == section){
        identifier = @"substractTableCell";
        keysArray = [_plantsSubstractDic allKeys];
    }
    else if(1 == section){
        identifier = @"progressTableCell";
        keysArray = [_progressDic allKeys];
    }else{
        identifier = @"diffProgressTableCell";
        keysArray = [_progressDiffDic allKeys];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    
    if( 0 == section){
        UILabel *cellLabel1 = (UILabel *)[cell viewWithTag:1];
        UILabel *cellLabel2 = (UILabel *)[cell viewWithTag:2];
        UILabel *cellLabel3 = (UILabel *)[cell viewWithTag:3];
        UILabel *cellLabel4 = (UILabel *)[cell viewWithTag:4];
        UILabel *cellLabel5 = (UILabel *)[cell viewWithTag:5];
        
        if(0 == row)
        {//这里是表头
            cellLabel1.text = @"电厂";
            cellLabel2.text = @"日电量";
            cellLabel3.text = @"月电量";
            cellLabel4.text = @"年累计";
            cellLabel5.text = @"年计划";
        }
        else
        {//这里是表的内容
            NSArray * subArray = [_plantsSubstractDic objectForKey:[keysArray objectAtIndex:row - 1]];
            cellLabel1.text = [keysArray objectAtIndex:row - 1];
            cellLabel2.text = [subArray objectAtIndex:0];
            cellLabel3.text = [subArray objectAtIndex:1];
            cellLabel4.text = [subArray objectAtIndex:2];
            cellLabel5.text = [subArray objectAtIndex:3];
        }
    }
    else if(1 == section){
        
        UILabel *cellLabel6 = (UILabel *)[cell viewWithTag:6];
        UIView *progressUIView = (UIView *)[cell viewWithTag:7];
        
        NSNumber *progressNum = [_progressDic objectForKey:[keysArray objectAtIndex:row]];
        LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(2, 2, progressUIView.frame.size.width-4, 22)];
        progressView.progress = [progressNum floatValue]/100;
        progressView.borderRadius = @5;
        progressView.color = [KD3CommonTools getColor:row];
        
        

        [progressUIView addSubview:progressView];
        cellLabel6.text = [keysArray objectAtIndex:row];
    }else{
        UILabel *cellLabel7 = (UILabel *)[cell viewWithTag:7];
        cellLabel7.text = [_progressDiffDic objectForKey:[keysArray objectAtIndex:row]];
    }
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
