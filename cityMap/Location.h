//
//  Location.h
//  cityMap
//
//  Created by BRUCE LAU on 14-4-23.
//  Copyright (c) 2014年 BRUCE LAU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject
@property(nonatomic,strong)NSString *latitude;
@property(nonatomic,strong)NSString *longitude;


-(id)initWithLatitude:(NSString *)theLatitude
            longitude:(NSString *)theLongitude;

@end
