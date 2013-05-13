//
//  ViewController.m
//  BookObjectiveC
//
//  Created by André Cocuroci on 07/05/13.
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
    
    NSString *buffer;
    //char meuChar[10] = "textotexto";
    
//    int meuArrayInt[10];
//    meuArrayInt[0] = 54;
//    meuArrayInt[1] = 55;
//    meuArrayInt[2] = 56;
//    meuArrayInt[3] = 57;
//    meuArrayInt[4] = 58;
//    
//    int meuInt = 2 * meuArrayInt[2];
    
    int total = 0;

    for(int i=0; i < 100; i++) {
        
        if(i == 52)
        {
            break;
        }
        
        if(i%2 == 0)
        {
            continue;
        }      
        
        total += i;
    }
    
    buffer = [[NSString alloc] initWithFormat:@"%d",total];
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Resultado" message:buffer delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
