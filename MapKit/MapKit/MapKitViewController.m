//
//  ViewController.m
//  MapKit
//
//  Created by Andrew Gama Branches on 07/05/15.
//  Copyright (c) 2015 Andrew Gama Branches. All rights reserved.
//

#import "MapKitViewController.h"

@interface MapKitViewController ()



@end

@implementation MapKitViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    //localizacao
    self.mapa.showsUserLocation = YES;
    
    [self.locationManager requestWhenInUseAuthorization];
    //[self.locationManager requestAlwaysAuthorization];
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 0.5; //user needs to press for half a second.
    [self.mapa addGestureRecognizer:lpgr];
    
}

//Zoom
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 300, 300);
    [self.mapa setRegion:[self.mapa regionThatFits:region] animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
 {
 CGPoint pt = [[touches anyObject]locationInView:self.mapa];
 CLLocationCoordinate2D latLong = [self.mapa convertPoint:pt toCoordinateFromView:self.mapa];
 //add code here for annotation
 
 MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
 point.coordinate = point.coordinate;
 point.title = @"Where am I?";
 point.subtitle = @"I'm here!!!";
 
 [self.mapa addAnnotation:point];
 
 NSLog(@"latitude= %f longitude = %f",latLong.latitude,latLong.longitude);
 //[self showMainMenu];
 }*/
- (IBAction)salvar:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancelar:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan) {
        return;
    }
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapa];
    CLLocationCoordinate2D touchMapCoordinate = [self.mapa convertPoint:touchPoint toCoordinateFromView:self.mapa];
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = touchMapCoordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    //for (id annotation in self.mapa.annotations) {
    //  [self.mapa removeAnnotation:annotation];
    //}
     //UIButton *rightButton=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    //[customAnnotationView setRightCalloutAccessoryView: rightButton];
    
    NSLog(@"latitude= %f longitude = %f",touchMapCoordinate.latitude,touchMapCoordinate.longitude);
    [self.mapa addAnnotation:point];
     
   
    
    // [count self.point];
}
- (IBAction)segmentedControl:(id)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            _mapa.mapType = MKMapTypeStandard;
            break;
        case 1:
            _mapa.mapType = MKMapTypeSatellite;
            break;
        case 2:
            _mapa.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}


-(void)mapa:(MKMapView *)mapa annotationView:(MKAnnotationView *) view calloutAccessoryControlTapped:(UIControl *) control
{
  
    NSLog(@"tapped");
}



@end
