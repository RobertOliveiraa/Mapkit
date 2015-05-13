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

@end

@implementation CadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.CadNome.text = self.cod.name;
    self.CadTelefone.text = self.cod.telefone;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"\n\n-----%lu",(unsigned long)[[[MapKitStore sharedStore] gatAllContacts] count]);
    return [[[MapKitStore sharedStore] gatAllContacts] count];
    ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"cell"];
    MapKit *teste = [[[MapKitStore sharedStore] gatAllContacts] objectAtIndex:indexPath.row];
    cell.textLabel.text = teste.name;
    cell.detailTextLabel.text = teste.telefone;
    return cell;
}

- (IBAction)saveButtonClicked:(id)sender {
    [[MapKitStore sharedStore]
     createUnidadeFederativaWithCode:self.CadTelefone.text
     andName:self.CadNome.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.CadTelefone) {
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789.-"] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
    }
    
    return YES;
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
