//
//  ViewController.h
//  MapKit
//
//  Created by Andrew Gama Branches on 07/05/15.
//  Copyright (c) 2015 Andrew Gama Branches. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (retain, nonatomic) IBOutlet MKMapView *mapa;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

