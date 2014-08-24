//
//  SKViewController.m
//  DriverHelper
//
//  Created by Sanchir Kartiev on 14.08.14.
//  Copyright (c) 2014 Sanchir Kartiev. All rights reserved.
//

#import "SKViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "MarkerInfoWindowViewController.h"

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
	 [super viewDidLoad];
	[self setUpMap];
	

	
	
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
	BOOL isExist = false;
	for (GMSMarker *existMarker in self.markers) {
		
		if(existMarker.position.latitude == coordinate.latitude && existMarker.position.longitude == coordinate.longitude)
		{
			existMarker.map = nil;
			isExist = true;
		}
	}
	if(isExist ==false)
	{
		CLLocationCoordinate2D position = coordinate;
		GMSMarker *marker = [GMSMarker markerWithPosition:position];
		marker.title = @"Hello";
		marker.map = self.google;
		[self.markers addObject:marker];
	}
}

/*-(UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker
{
	
}*/

-(void) mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker
{
	self.infoWindow = [[[NSBundle mainBundle] loadNibNamed:@"MarkerInfoWindowViewController" owner:self options:nil] lastObject];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
