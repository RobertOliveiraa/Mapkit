//
//  CadastroViewController.h
//  MapKit
//
//  Created by Robert Pinto de Oliveira on 11/05/15.
//  Copyright (c) 2015 bepid fucapi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CadastroEditViewController.h"

@interface CadastroViewController : UIViewController <UINavigationControllerDelegate>

@property (strong, nonatomic) CadastroEditViewController *cod;
@property (weak, nonatomic) IBOutlet UITextField *CadNome;
@property (weak, nonatomic) IBOutlet UITextField *CadTelefone;

@end
