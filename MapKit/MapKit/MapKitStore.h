//
//  CadastroStoreViewController.h
//  MapKit
//
//  Created by Robert Pinto de Oliveira on 11/05/15.
//  Copyright (c) 2015 bepid fucapi. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;
#import "MapKit.h"

@interface MapKitStore : NSObject

+ (instancetype)sharedStore;

- (void)createUnidadeFederativaWithCode:(NSString *)code andName:(NSString *)name;
- (NSArray *)gatAllContacts;
- (void) setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;
@end