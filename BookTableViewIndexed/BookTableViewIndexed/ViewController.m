//
//  ViewController.m
//  BookTableViewIndexed
//
//  Created by André Cocuroci on 15/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"bandas" ofType:@"plist"];
    NSDictionary *myDictionary = [[NSDictionary alloc] initWithContentsOfFile:filepath];
    musicalGroups = myDictionary;
    NSArray *myArray = [[musicalGroups allKeys] sortedArrayUsingSelector:@selector(compare:)];    
    keysOfMusicalGroups = myArray;
    
    NSLog(@"musicalGroups: %@, keysOfMusicalGroups: %@",[musicalGroups objectForKey:@"A"],keysOfMusicalGroups);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    NSString *key = [keysOfMusicalGroups objectAtIndex:section];
    NSArray *sectionValues = [musicalGroups objectForKey:key];
    
    static NSString *cellId = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [sectionValues objectAtIndex:row];
    
    return cell;
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return keysOfMusicalGroups;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [keysOfMusicalGroups count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *myKey = [keysOfMusicalGroups objectAtIndex:section];
    NSArray *sectionValues = [musicalGroups objectForKey:myKey];
    return [sectionValues count];
}

@end
