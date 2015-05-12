//
//  CadastroStoreViewController.h
//  MapKit
//
//  Created by Robert Pinto de Oliveira on 11/05/15.
//  Copyright (c) 2015 bepid fucapi. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;
#import "CadastroEditViewController.h"

@interface CadastroStoreViewController : NSObject

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

+ (instancetype)sharedStore;

- (CadastroEditViewController *)createCadastroEditWithCode:(NSString *)name andtelefone:(NSString *)telefone;
- (void)removeCadastroEdit:(CadastroEditViewController *)cod;
- (BOOL)saveChanges;

@end