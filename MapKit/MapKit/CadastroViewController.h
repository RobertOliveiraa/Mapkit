//
//  CadastroViewController.h
//  MapKit
//
//  Created by Robert Pinto de Oliveira on 11/05/15.
//  Copyright (c) 2015 bepid fucapi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit.h"
#import <CoreLocation/CoreLocation.h>

@interface CadastroViewController : UIViewController <UINavigationControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) MapKit *cod;
@property (weak, nonatomic) IBOutlet UITextField *CadNome;
@property (weak, nonatomic) IBOutlet UITextField *CadTelefone;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
