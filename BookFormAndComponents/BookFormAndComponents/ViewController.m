//
//  ViewController.m
//  BookFormAndComponents
//
//  Created by André Cocuroci on 13/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)componentUIAlertView
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Aviso" message:@"Operação realizada!" delegate:nil cancelButtonTitle:@"Fechar" otherButtonTitles:nil];

    [alert show];    
}

- (IBAction)componentUIActionSheet:(id)sender
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Deseja continuar?" delegate:self cancelButtonTitle:@"Não" destructiveButtonTitle:@"Sim" otherButtonTitles:nil];
    
    [sheet showInView:self.view];
}

- (IBAction)componentUILabel:(id)sender
{
    self.myLabel.text = @"Texto alterado";
}

- (IBAction)componentUITextField:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UITextField" message:self.myTextField.text delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

- (IBAction)textFieldReturn:(id)sender
{
    [self.myTextField resignFirstResponder];
}

- (IBAction)backgrondTouch:(id)sender
{
    [self.myTextField resignFirstResponder];
}

- (IBAction)componentSliderValueChanged:(id)sender
{
    int sliderValue = (int) self.mySlider.value;
    self.mySliderLabel.text = [[NSString alloc] initWithFormat:@"%d",sliderValue];
}

- (IBAction)componentSwitchChangedValue:(id)sender
{
    NSString *msg;
    
    if(self.mySwitch.isOn)
    {
        msg = @"Ligado";
        
    } else
    {
         msg = @"Desligado";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UISwitch" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

- (IBAction)componentSegChangedValue:(id)sender
{
    int selectedIndex = [self.mySegControl selectedSegmentIndex];
    NSString *msg = [self.mySegControl titleForSegmentAtIndex:selectedIndex];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UISegmentedControl" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

-(void) actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString *msg;
    
    if(buttonIndex != [actionSheet cancelButtonIndex])
    {
        msg = [[NSString alloc] initWithFormat:@"Pressionou Sim"];
    } else {
        msg = [[NSString alloc] initWithFormat:@"Pressionou Não"];
    }
    
    [self showAlert:msg];
}

-(void)showAlert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mensagem de decisão" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

@end
