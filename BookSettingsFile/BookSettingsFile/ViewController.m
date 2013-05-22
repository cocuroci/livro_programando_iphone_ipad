//
//  ViewController.m
//  BookSettingsFile
//
//  Created by André Cocuroci on 22/05/13.
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

-(IBAction)atualizar:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.labelServidor.text = [defaults objectForKey:@"keyServidor"];
    self.labelPorta.text = [defaults objectForKey:@"keyPorta"];
    self.labelEmail.text = [defaults objectForKey:@"keyEmail"];
    self.labelSenha.text = [defaults objectForKey:@"keySenha"];
    self.labelAutoLogin.text = [[defaults objectForKey:@"keyAutoLogin"] integerValue] ? @"Sim" : @"Não";
    self.labelModo.text = [defaults objectForKey:@"keyModo"];
    self.labelEspaco.text = [[defaults objectForKey:@"keyEspaco"] stringValue];
    
    NSLog(@"%@", [defaults objectForKey:@"keyAutoLogin"]);
}

@end
