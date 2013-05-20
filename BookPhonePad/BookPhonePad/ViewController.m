//
//  ViewController.m
//  BookPhonePad
//
//  Created by André Cocuroci on 20/05/13.
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

-(IBAction)changeLabelValue
{
    NSString *myString;
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        myString = @"Dispositivo: iPhone";
    }
    else
    {
        myString = @"Dispositivo: iPad";
    }
    
    self.myLabel.text = myString;
    
    NSLog(@"Version %@", [[UIDevice currentDevice] systemVersion]);
}

@end
