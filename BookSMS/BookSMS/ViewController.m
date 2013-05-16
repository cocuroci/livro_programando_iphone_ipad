//
//  ViewController.m
//  BookSMS
//
//  Created by André Cocuroci on 16/05/13.
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

- (IBAction)sendMessage:(id)sender
{
    NSArray *recipients = [NSArray arrayWithObject:@"41-9999-9999"];
    
    MFMessageComposeViewController *myController = [[MFMessageComposeViewController alloc] init];
    
    if([MFMessageComposeViewController canSendText])
    {
        myController.body = @"Texto da sua mensagem";
        myController.recipients = recipients;
        myController.messageComposeDelegate = self;
        [self presentViewController:myController animated:YES completion:nil];
    }
    
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if(result != MessageComposeResultSent)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Falha no envio do SMS" message:@"A Mensagem não pode ser enviada" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
}

@end
