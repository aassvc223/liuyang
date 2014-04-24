//
//  MapViewController.m
//  cityMap
//
//  Created by BRUCE LAU on 14-4-23.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import "MapViewController.h"
#import "Location.h"
@interface MapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>

@end

@implementation MapViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog(@"可用");
        
        _locManager=[[CLLocationManager alloc]init];
        _locManager.delegate=self;
        [_locManager startUpdatingLocation];
    }else{
        NSLog(@"设备不可用!");
    }
    
    _myMapView=[[MKMapView alloc]initWithFrame:self.view.bounds];
    CLLocationCoordinate2D coor=CLLocationCoordinate2DMake(self.a,self.b);
    MKCoordinateSpan span=MKCoordinateSpanMake(1, 1);
    _myMapView.region=MKCoordinateRegionMake(coor, span);
    _myMapView.showsUserLocation=YES;
    _myMapView.mapType=MKMapTypeStandard;
    _myMapView.delegate=self;
    [self.view addSubview:_myMapView];
    
    _point=[[MKPointAnnotation alloc]init];
    _point.coordinate=coor;

    [_myMapView addAnnotation:_point];
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
