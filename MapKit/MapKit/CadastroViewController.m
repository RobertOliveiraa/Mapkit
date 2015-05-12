//
//  CadastroViewController.m
//  MapKit
//
//  Created by Robert Pinto de Oliveira on 11/05/15.
//  Copyright (c) 2015 bepid fucapi. All rights reserved.
//

#import "CadastroViewController.h"
#import "CadastroStoreViewController.h"

@interface CadastroViewController ()

@end

@implementation CadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.CadNome.text = self.cod.nome;
    self.CadTelefone.text = self.cod.telefone;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dismissKeyboard {
    [self.CadNome resignFirstResponder];
    [self.CadTelefone resignFirstResponder];
}
- (IBAction)saveButtonClicked:(id)sender {
    if (!self.cod) {
        self.cod = [[CadastroStoreViewController sharedStore] createCadastroEditWithCode:self.CadNome.text andtelefone:self.CadTelefone.text];
    } else {
        self.cod.nome = self.CadNome.text;
        self.cod.telefone = self.CadTelefone.text;
        
    }
    
    [[CadastroStoreViewController sharedStore] saveChanges];
    
    [self.navigationController popViewControllerAnimated:YES];
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
