//
//  Modal.m
//  BookFirstProject
//
//  Created by André Cocuroci on 07/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "Modal.h"

@interface Modal ()

@end

@implementation Modal

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
}
@end
