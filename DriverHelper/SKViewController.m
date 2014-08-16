//
//  SKViewController.m
//  DriverHelper
//
//  Created by Sanchir Kartiev on 14.08.14.
//  Copyright (c) 2014 Sanchir Kartiev. All rights reserved.
//

#import "SKViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface SKViewController () <GMSMapViewDelegate>

@end

@implementation SKViewController
- (void)setUpMap
{
    //self.google = [GMSMapView mapWithFrame:CGRectZero camera:camera];
	self.google.myLocationEnabled = YES;
	self.google.settings.myLocationButton = YES;
	self.google.settings.compassButton = YES;
	self.google.delegate =self;
}

- (void)viewDidLoad
{
	//GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:6];
	
	[self setUpMap];
    //GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:47.248552
      //                                                      longitude:39.702460
        //                                                         zoom:15];
    //GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    /*GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(47.248552, 39.702460);
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.icon = [UIImage imageNamed:@"flag_icon"];
    marker.map = self.google;
    */

	
        [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
	CLLocationCoordinate2D position = coordinate;
	GMSMarker *marker = [GMSMarker markerWithPosition:position];
	marker.title = @"Дарова чувак";
	marker.map = self.google;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
