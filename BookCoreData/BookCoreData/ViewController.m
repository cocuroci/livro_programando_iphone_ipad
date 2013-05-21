//
//  ViewController.m
//  BookCoreData
//
//  Created by André Cocuroci on 21/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Pessoas.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self readValues];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addNewValue
{
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    Pessoas *pessoa = [NSEntityDescription insertNewObjectForEntityForName:@"Pessoas" inManagedObjectContext:myAppDelegate.managedObjectContext];
    
    pessoa.nome = self.myFirstName.text;
    pessoa.sobrenome = self.myLastName.text;
    
    [myAppDelegate.managedObjectContext save:nil];
    
    [self readValues];
    
    self.myFirstName.text = @"";
    self.myLastName.text = @"";
}

-(IBAction)readValues
{
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"Pessoas" inManagedObjectContext:myAppDelegate.managedObjectContext];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES]];
    //request.predicate = [NSPredicate predicateWithFormat:@"nome LIKE %@",@"André"];
    
    NSError *myError = nil;
    
    myValues = [myAppDelegate.managedObjectContext executeFetchRequest:request error:&myError];
    
    if(myError)
    {
        NSLog(@"%@", [myError description]);
    }
    
    [self.myTableView reloadData];
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

#pragma mark - tableview

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myValues count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"IdentificadorQualquer";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    if([myValues count] > 0)
    {
        Pessoas *pessoa = [myValues objectAtIndex:indexPath.row];
        cell.textLabel.text = pessoa.nome;
        cell.detailTextLabel.text = pessoa.sobrenome;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    Pessoas *pessoa = [myValues objectAtIndex:indexPath.row];
    [myAppDelegate.managedObjectContext deleteObject:pessoa];
    [myAppDelegate.managedObjectContext save:nil];
    [self readValues];
}

@end
