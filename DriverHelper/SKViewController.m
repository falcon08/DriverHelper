//
//  SKViewController.m
//  DriverHelper
//
//  Created by Sanchir Kartiev on 14.08.14.
//  Copyright (c) 2014 Sanchir Kartiev. All rights reserved.
//

#import "SKViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface SKViewController ()

@end

@implementation SKViewController
- (void)viewDidLoad
{
	GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:6];
	
    self.google = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.google.myLocationEnabled = YES;
    //self.view = self.google;
	
    // create a marker in the center of the map
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet=@"Austrailia";
    marker.map = self.google;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
