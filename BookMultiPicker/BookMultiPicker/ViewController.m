//
//  ViewController.m
//  BookMultiPicker
//
//  Created by André Cocuroci on 17/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myPickerData, myPickerDataFlavours;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    myPickerData = @[@"Suco",@"Refrigerante",@"Cerveja",@"Drink"];
    myPickerDataFlavours = @[@[@"Laranja",@"Uva",@"Abacaxi"],@[@"Cola",@"Limão",@"Guaraná"],@[@"Clara",@"Escura"],@[@"Alexander",@"Manhattan",@"Pina Colada"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showValue
{
    NSInteger myRow = [self.myMultiPicker selectedRowInComponent:0];
    NSString *myValue = [myPickerData objectAtIndex:myRow];
    
    NSInteger myRowFlavour = [self.myMultiPicker selectedRowInComponent:1];
    NSString *myValueFlavour = [[myPickerDataFlavours objectAtIndex:myRow] objectAtIndex:myRowFlavour];
    
    NSString *myMessage = [[NSString alloc] initWithFormat:@"%@ (%@)", myValue, myValueFlavour];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta" message:myMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0) {
        return [myPickerData count];
    } else {        
        return [[myPickerDataFlavours objectAtIndex:[self.myMultiPicker selectedRowInComponent:0]] count];
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0) {
        return [myPickerData objectAtIndex:row];
    } else {
        return [[myPickerDataFlavours objectAtIndex:[self.myMultiPicker selectedRowInComponent:0]] objectAtIndex:row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0)
    {
        [self.myMultiPicker selectRow:0 inComponent:1 animated:YES];
        [self.myMultiPicker reloadComponent:1];
    }
}

@end
