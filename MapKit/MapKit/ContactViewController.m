//
//  ContactViewController.m
//  MapKit
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 11/05/15.
//  Copyright (c) 2015 bepid fucapi. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate, UISearchResultsUpdating>
@property (weak,nonatomic) IBOutlet UITableView *Tableview;
@property (weak, nonatomic) IBOutlet UISearchBar *searchContacts;

@property (nonatomic) NSMutableArray *arrayFromUser;
@property NSMutableArray *arrayContacts;
@property NSMutableArray *arrayAutocomplete;

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initProperties];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
//    tap.cancelsTouchesInView = NO;
//    [self.view addGestureRecognizer:tap];
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{

}
-(void)initProperties{
    self.arrayContacts = [[NSMutableArray alloc] initWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6"]];
    self.arrayAutocomplete = [[NSMutableArray alloc] init];
}
//AUTOCOMPLETE
- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    NSLog(@"method autocomplete");
    [self.arrayAutocomplete removeAllObjects];
    NSArray *auxiliar = [NSArray arrayWithArray:self.arrayContacts];
    for (NSString *curString in auxiliar) {
        NSRange substringRange = [curString rangeOfString:substring];
        if (substringRange.location == 0) {
            [self.arrayAutocomplete addObject:curString];
        }
    }
    [self.Tableview reloadData];
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText
{
    NSString *name = @"";
    NSString *firstLetter = @"";
    
    if (self.arrayAutocomplete.count > 0)
        [self.arrayAutocomplete removeAllObjects];
    
    if ([searchText length] > 0)
    {
        for (int i = 0; i < [self.arrayContacts count] ; i = i+1)
        {
            name = [self.arrayContacts objectAtIndex:i];
            
            if (name.length >= searchText.length)
            {
                firstLetter = [name substringWithRange:NSMakeRange(0, [searchText length])];
                //NSLog(@"%@",firstLetter);
                
                if( [firstLetter caseInsensitiveCompare:searchText] == NSOrderedSame )
                {
                    // strings are equal except for possibly case
                    [self.arrayAutocomplete addObject: [self.arrayContacts objectAtIndex:i]];
                    NSLog(@"=========> %@",self.arrayAutocomplete);
                }
            }
        }
    }
    else
    {
        [self.arrayAutocomplete addObjectsFromArray:self.arrayContacts ];
    }
    
    [self.Tableview reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    NSLog(@"number sections");

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.arrayAutocomplete!=nil){
        NSLog(@"number arrayauto");

        return self.arrayAutocomplete.count;

        
    }
    else{
        NSLog(@"number arraycontact");

        return self.arrayContacts.count;
    }
        //if (self.arrayFromUser.count != 0)
        //return self.arrayFromUser.count;
    //return 0;    return self.arrayContacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (self.arrayAutocomplete!=nil) {
        cell.textLabel.text = [self.arrayAutocomplete objectAtIndex:indexPath.row];

    }
    else{
        cell.textLabel.text = [self.arrayContacts objectAtIndex:indexPath.row];
    }
 // Configure the cell...

 return cell;
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
