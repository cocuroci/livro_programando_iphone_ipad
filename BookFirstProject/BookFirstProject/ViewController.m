//
//  ViewController.m
//  BookFirstProject
//
//  Created by André Cocuroci on 07/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"
#import "Modal.h"

@interface ViewController () {
    UIViewController *t;
    Modal *m;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    t = [[UIViewController alloc] init];
    t.view.backgroundColor =  [UIColor redColor];
    //[self.view addSubview:t];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)callView:(id)sender
{
    t.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:t animated:YES completion:^{
        NSLog(@"Ok");
    }];
    
//    m = [[Modal alloc] init];
//    m.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self presentViewController:m animated:YES completion:^{
//        NSLog(@"Ok");
//    }];
}
@end
