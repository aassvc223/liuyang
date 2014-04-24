//
//  MapViewController.h
//  cityMap
//
//  Created by BRUCE LAU on 14-4-23.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface MapViewController : UIViewController<MKMapViewDelegate>
{
    CLLocationManager *_locManager;
    MKPointAnnotation *_point;
}
@property (nonatomic, strong) MKMapView *myMapView;
@property(nonatomic,assign)CGFloat a;
@property(nonatomic,assign)CGFloat b;

@end
