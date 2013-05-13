//
//  ViewController.m
//  BookCocoaTouch
//
//  Created by André Cocuroci on 13/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self myFirstAction:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)myFirstAction:(id)sender
{
    NSString *myText;
    
    if(sender) {
        myText = [NSString stringWithFormat:@"Clique no botão: %@", myLabel.text];
    } else {
        myText = [[NSString alloc] initWithString:myLabel.text];
    }    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Texto Label" message:myText delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}
@end
