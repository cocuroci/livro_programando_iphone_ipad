//
//  ViewController.m
//  BookSinglePicker
//
//  Created by André Cocuroci on 17/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    myPickerData = @[@"Suco", @"Refrigerante", @"Cerveja", @"Drink"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showValue
{
    NSInteger myRow = [self.mySinglePicker selectedRowInComponent:0];
    NSString *myValue = [myPickerData objectAtIndex:myRow];
    NSString *myMessage = [[NSString alloc] initWithFormat:@"%@", myValue];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta" message:myMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    NSString *myMessage = [[NSString alloc] initWithFormat:@"O valor %@ acabou de ser selecionado.", [myPickerData objectAtIndex:row]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alteração de valor" message:myMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [myPickerData count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [myPickerData objectAtIndex:row];
}

@end
