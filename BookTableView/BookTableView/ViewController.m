//
//  ViewController.m
//  BookTableView
//
//  Created by André Cocuroci on 14/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.myDataSource = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < 20; i++)
    {
        NSString *nome = [[NSString alloc] initWithFormat:@"Nome %d", i];
        NSString *sobrenome = [[NSString alloc] initWithFormat:@"Sobrenome %d", i];
        
        NSArray *temp = [[NSArray alloc] initWithObjects:nome, sobrenome, nil];
        [self.myDataSource addObject:temp];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myDataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myId = @"Exemplo";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myId];
    
    if(cell == nil)
    {       
        [[NSBundle mainBundle] loadNibNamed:@"myCell" owner:self options:nil];
        cell = self.myCustomCell;
        
        NSArray *myObject = [self.myDataSource objectAtIndex:indexPath.row];
        
        UILabel *labelFirstName = (UILabel *)[cell viewWithTag:1];
        UILabel *labelLastName = (UILabel *)[cell viewWithTag:2];
        
        labelFirstName.text = [myObject objectAtIndex:0];
        labelLastName.text = [myObject objectAtIndex:1];
        
        return cell;
        
    } else {
        return nil;
    }
    
//    NSArray *obj = [self.myDataSource objectAtIndex:indexPath.row];
//    UIImage *icon = [UIImage imageNamed:@"iconeCubo.png"];
//    UIImage *iconh = [UIImage imageNamed:@"iconeCuboDestaque.png"];
//    
//    cell.textLabel.text = [obj objectAtIndex:0];
//    cell.detailTextLabel.text = [obj objectAtIndex:1];
//    cell.imageView.image = icon;
//    cell.imageView.highlightedImage = iconh;    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *myMessage = [[NSString alloc] initWithFormat:@"%@", [[self.myDataSource objectAtIndex:indexPath.row] objectAtIndex:0]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Informação" message:myMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
