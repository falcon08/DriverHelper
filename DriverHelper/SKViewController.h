//
//  SKViewController.h
//  DriverHelper
//
//  Created by Sanchir Kartiev on 14.08.14.
//  Copyright (c) 2014 Sanchir Kartiev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface SKViewController : UIViewController
@property (weak, nonatomic) IBOutlet GMSMapView *google;

@end
