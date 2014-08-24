//
//  SKViewController.h
//  DriverHelper
//
//  Created by Sanchir Kartiev on 14.08.14.
//  Copyright (c) 2014 Sanchir Kartiev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "MarkerInfoWindowViewController.h"

@interface SKViewController : UIViewController
@property (weak, nonatomic) IBOutlet GMSMapView *google;
@property (nonatomic,weak) NSMutableArray *markers;
@property (nonatomic,weak) MarkerInfoWindowViewController *infoWindow;

@end
