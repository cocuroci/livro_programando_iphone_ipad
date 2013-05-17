//
//  ViewController.m
//  BookDataPicker
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showValue
{
    NSDate *myDate = [self.myDataPicker date];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data" message:[[NSString alloc] initWithFormat:@"%@",myDate]  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}
@end
