//
//  ViewController.m
//  BookLocalizable
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
	
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flag"]];    
    [self.view addSubview:image];
    
    self.myLabel.text = NSLocalizedString(@"Label campo nome", nil);
    [self.myButton setTitle:NSLocalizedString(@"Botão título", nil) forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)process
{
    
}

@end
