//
//  CadastroStoreViewController.m
//  MapKit
//
//  Created by Robert Pinto de Oliveira on 11/05/15.
//  Copyright (c) 2015 bepid fucapi. All rights reserved.
//

#import "MapKitStore.h"
#import "AppDelegate.h"

@interface MapKitStore ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property NSMutableArray *privateItems;
@end

@implementation MapKitStore

+ (instancetype)sharedStore {
    static MapKitStore *sharedStore = nil;
    
    if (!sharedStore) {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        sharedStore = [[self alloc] initPrivate];
        sharedStore.managedObjectContext = appDelegate.managedObjectContext;
    }
    
    return sharedStore;
}

- (instancetype)initPrivate {
    self = [super init];
    return self;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[TesteStore sharedStore]"
                                 userInfo:nil];
}


- (void)createUnidadeFederativaWithCode:(NSString *)code andName:(NSString *)name
{
    MapKit *uf = [NSEntityDescription
                 insertNewObjectForEntityForName:@"MapKit"
                 inManagedObjectContext:self.managedObjectContext];
    
    uf.id = [[[NSUUID alloc] init] UUIDString];
    uf.telefone = code;
    uf.name = name;
    
    NSError *error;
    NSLog(@"4");
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Could not save %@, %@", error, error.userInfo);
    }
}

- (void) setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext{
    
    if(!self.managedObjectContext){
        _managedObjectContext = managedObjectContext;
        [self loadAllContacts];
    }
}
- (void)loadAllContacts{
    
    if (!self.privateItems) {
        
        // Objeto para buscar dados no BD
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"MapKit"];
        
        //Executa consulta no BD
        NSError *error;
        
        NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (!result) {
            [NSException raise:@"Fetch failed" format:@"Reason: %@", [error localizedDescription]];
        }
        
        self.privateItems = [NSMutableArray arrayWithArray:result];
    }
    
}
- (NSArray *)gatAllContacts{
    return [self.privateItems copy];
}


@end
