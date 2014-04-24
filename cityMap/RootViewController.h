//
//  RootViewController.h
//  cityMap
//
//  Created by BRUCE LAU on 14-4-23.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
{
    NSMutableArray *jingdu;
    NSMutableArray *weidu;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableData *datas;
@property(nonatomic,strong)NSArray *cityArrays;
@property(nonatomic,strong)NSMutableArray *city;
@property(nonatomic,strong)NSMutableArray *locationArray;
@property(nonatomic,strong)NSString *lat;
@property(nonatomic,strong)NSString *lon;

@end
