//
//  CadastroViewController.m
//  MapKit
//
//  Created by Robert Pinto de Oliveira on 11/05/15.
//  Copyright (c) 2015 bepid fucapi. All rights reserved.
//

#import "CadastroViewController.h"
#import "MapKitStore.h"

@interface CadastroViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *autocompleteNumber;
@property MapKit *array;
@end

@implementation CadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.CadNome.text = self.cod.name;
    self.CadTelefone.text = self.cod.telefone;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
    [self.CadTelefone setKeyboardType:UIKeyboardTypeNumberPad];
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"\n\n-----%lu",(unsigned long)[[[MapKitStore sharedStore] gatAllContacts] count]);
    return [[[MapKitStore sharedStore] gatAllContacts] count];
    ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"cell"];
    MapKit *teste = [[[MapKitStore sharedStore] gatAllContacts] objectAtIndex:indexPath.row];
    self.array = teste;
    cell.textLabel.text = teste.name;
    cell.detailTextLabel.text = teste.telefone;
    if([self.autocompleteNumber containsObject:teste.telefone])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.accessoryType = NO;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryNone)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.autocompleteNumber addObject:self.array];
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.autocompleteNumber removeObject:self.array];
        
    }
    NSLog(@"\n\n\n%@", self.autocompleteNumber);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)cancelButtonClicked:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveButtonClicked:(id)sender {
    [[MapKitStore sharedStore]
     createUnidadeFederativaWithCode:self.CadTelefone.text
     andName:self.CadNome.text];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissKeyboard {
    [self.CadNome resignFirstResponder];
    [self.CadTelefone resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
