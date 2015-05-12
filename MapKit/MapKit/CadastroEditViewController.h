//
//  CadastroEditViewController.h
//  MapKit
//
//  Created by Robert Pinto de Oliveira on 11/05/15.
//  Copyright (c) 2015 bepid fucapi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CadastroEditViewController : 
NSManagedObject

@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * cod;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * telefone;

@end
