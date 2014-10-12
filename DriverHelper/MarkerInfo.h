//
//  MarkerInfo.h
//  DriverHelper
//
//  Created by Sanchir Kartiev on 23.08.14.
//  Copyright (c) 2014 Sanchir Kartiev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>



@interface MarkerInfo : NSObject
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *description;
@property (nonatomic) CLLocationCoordinate2D coordinates;
@property (nonatomic) NSDictionary *commentsArray;
@property (nonatomic) NSInteger ratio;



@end
