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
}

- (void)viewDidLoad
{
	//GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:6];
	
	[self setUpMap];

	
        [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
