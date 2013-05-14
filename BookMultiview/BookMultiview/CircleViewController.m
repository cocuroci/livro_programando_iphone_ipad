//
//  CircleViewController.m
//  BookMultiview
//
//  Created by André Cocuroci on 14/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "CircleViewController.h"
#import "AppDelegate.h"

@interface CircleViewController ()

@end

@implementation CircleViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)myAction
{
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    myAppDelegate.myNumber = [[NSNumber alloc] initWithInt:[myAppDelegate.myNumber intValue] + 1];
    
    NSString *title = [[NSString alloc] initWithFormat:@"Tela %@", self.myLabel.text];
    NSString *message = [[NSString alloc] initWithFormat:@"%@ (%d)", self.myLabel.text, [myAppDelegate.myNumber intValue]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title  message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alert show];
}

@end
