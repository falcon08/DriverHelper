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
- (void)startLocationUpdate
{
	self.locationManager = [[CLLocationManager alloc] init];
	self.locationManager.delegate = self;
	self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
	self.locationManager.distanceFilter = 100; // meters
	[self.locationManager startUpdatingLocation];
}

- (void)setUpMap
{
	GMSCameraUpdate *zoomCamera = [GMSCameraUpdate zoomTo:16];
	[self startLocationUpdate];
	[self.google moveCamera:zoomCamera];
	self.google.myLocationEnabled = YES;
	self.google.settings.myLocationButton = YES;
	self.google.settings.compassButton = YES;
	self.google.delegate =self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self setUpMap];
}
-(void)viewWillAppear:(BOOL)animated
{
	
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
		marker.title = @"Нажмите сюда, чтобы ";
		marker.map = self.google;
		[self.markers addObject:marker];
	}
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
	CLLocation* location = [locations lastObject];
	NSDate* eventDate = location.timestamp;
	NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
	if (abs(howRecent) < 15.0) {
		self.latitude = location.coordinate.latitude;
		self.longitude = location.coordinate.longitude;
	}
	[self.google animateToLocation:CLLocationCoordinate2DMake(self.latitude, self.longitude)];

}


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
