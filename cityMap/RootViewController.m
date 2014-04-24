//
//  RootViewController.m
//  cityMap
//
//  Created by BRUCE LAU on 14-4-23.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import "RootViewController.h"
#import "MapViewController.h"
#import "GDataXMLNode.h"
#import "Location.h"
@interface RootViewController ()<NSURLConnectionDataDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title=@"城市列表";
    self.tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
}

-(void)prepareDatas{
    jingdu=[[NSMutableArray alloc]init];
    weidu=[[NSMutableArray alloc]init];
    self.cityArrays=[[NSArray alloc]init];
    NSURL *url=[NSURL URLWithString:@"http://www.meituan.com/api/v1/divisions"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark-NSURLConnectionDataDelegate代理方法

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _datas=nil;
    _datas=[NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_datas appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    //XML解析
    GDataXMLDocument *doc=[[GDataXMLDocument alloc]initWithData:_datas options:0 error:nil];
    GDataXMLElement *root=[doc rootElement];

    self.city=[NSMutableArray array];
    self.cityArrays=[root elementsForName:@"divisions"];
    for (int i=0; i<[self.cityArrays count]; i++) {
        GDataXMLElement *citys=[self.cityArrays objectAtIndex:i];
        
//获取城市的节点
        NSArray *cityArray=[citys elementsForName:@"division"];
        for (int j=0; j<[cityArray count]; j++) {
            GDataXMLElement *city=[cityArray objectAtIndex:j];
            
            NSString *cityName=[[[city elementsForName:@"name"]lastObject]stringValue];
            [self.city addObject:cityName];
            
            NSArray *location=[city elementsForName:@"location"];
            for(int k=0;k<[location count];k++){
                GDataXMLElement *loc=[location objectAtIndex:k];
                self.lat=[[[loc elementsForName:@"latitude"]lastObject]stringValue];
                self.lon=[[[loc elementsForName:@"longitude"]lastObject]stringValue];
                [jingdu addObject:self.lat];
                [weidu addObject:self.lon];
            }
        }
    }
    [self.tableView reloadData];
}


#pragma mark-UITableViewDataSource代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.city count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"123";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text=self.city[indexPath.row];
    return cell;
}

#pragma mark-UITableViewDelegate代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MapViewController *mapVC=[[MapViewController alloc]init];
    mapVC.a=[jingdu[indexPath.row] floatValue];
    mapVC.b=[[weidu objectAtIndex:indexPath.row] floatValue];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
