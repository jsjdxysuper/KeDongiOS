//
//  CommonTools.m
//  kedong
//
//  Created by apple on 14-7-18.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "KD3CommonTools.h"

@implementation KD3CommonTools


+ (UIColor*)getColor:(NSInteger)index
{
    
    
    UIColor *ret;
    switch (index) {
        case 0:
            ret = [UIColor orangeColor];
            break;
        case 1:
            ret = [UIColor brownColor];
            break;
        case 2:
            ret = [UIColor yellowColor];
            break;
        case 3:
            ret = [UIColor cyanColor];
            break;
        case 4:
            ret = [UIColor blueColor];
            break;
        case 5:
            ret = [UIColor greenColor];
            break;
        case 6:
            ret = [UIColor redColor];
            break;
        case 7:
            ret = [UIColor magentaColor];
            break;
        case 8:
            ret = [UIColor purpleColor];
            break;
        case 9:
            ret = [UIColor darkGrayColor];
            break;
        default:
            break;
    }

    return ret;
}
@end
