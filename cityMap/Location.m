//
//  Location.m
//  cityMap
//
//  Created by BRUCE LAU on 14-4-23.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import "Location.h"
@implementation Location
-(id)initWithLatitude:(NSString *)theLatitude
            longitude:(NSString *)theLongitude{
    if (self=[super init]) {
        self.latitude=theLatitude;
        self.longitude=theLongitude;
    }
    return self;
}
@end
