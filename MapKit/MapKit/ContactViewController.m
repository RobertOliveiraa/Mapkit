//
//  ContactViewController.m
//  MapKit
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 11/05/15.
//  Copyright (c) 2015 bepid fucapi. All rights reserved.
//

#import "ContactViewController.h"
#import "MapKitStore.h"
@interface ContactViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak,nonatomic) IBOutlet UITableView *Tableview;
@property (weak, nonatomic) IBOutlet UISearchBar *searchContacts;
@property (weak, nonatomic) IBOutlet UITextField *textFiel;
@property NSMutableArray *arrayNumber;
@property NSMutableArray *arrayNames;
@property NSMutableArray *autocompleteNumber;
@property NSMutableArray *autocompleteNames;
@end

@implementation ContactViewController

- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    self.arrayNumber = [[NSMutableArray alloc] initWithArray:@[@"aaaaaaa",@"bbbbbbb",@"ccccccc",@"ddddddd",@"eeeeeee",@"fffffff"]];

    //self.arrayNumber = [[NSMutableArray alloc] initWithArray:    [[MapKitStore sharedStore] gatAllContacts]];
    self.arrayNames = [[NSMutableArray alloc] initWithArray:@[@"aaaaaaa",@"bbbbbbb",@"ccccccc",@"ddddddd",@"eeeeeee",@"fffffff"]];
    self.autocompleteNumber = [[NSMutableArray alloc] init];
    self.autocompleteNames = [[NSMutableArray alloc] init];
    [super viewDidLoad];

}

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    NSLog(@"----------------------------");
    
    [self.autocompleteNumber removeAllObjects];
    for(NSString *curString in self.arrayNumber) {
        NSRange substringRange = [curString rangeOfString:substring];
        if (substringRange.location == 0) {
            [self.autocompleteNumber addObject:curString];
        }
    }
    [self.Tableview reloadData];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    self.Tableview.hidden = NO;
    
    NSString *substring = [NSString stringWithString:textField.text];
    substring = [substring stringByReplacingCharactersInRange:range withString:string];
    [self searchAutocompleteEntriesWithSubstring:substring];
    NSLog(@"----------------------------");
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.arrayNumber.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.arrayNumber objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.arrayNames objectAtIndex:indexPath.row];
    if([self.autocompleteNumber containsObject:[self.arrayNumber objectAtIndex:indexPath.row]])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.accessoryType = NO;
 // Configure the cell...

 return cell;
 }

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryNone)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.autocompleteNumber addObject:[self.arrayNumber objectAtIndex:indexPath.row]];
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.autocompleteNumber removeObject:[self.arrayNumber objectAtIndex:indexPath.row]];

    }
    NSLog(@"\n\n\n%@", self.autocompleteNumber);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
