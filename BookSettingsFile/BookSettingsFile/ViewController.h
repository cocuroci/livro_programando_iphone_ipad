//
//  ViewController.h
//  BookSettingsFile
//
//  Created by André Cocuroci on 22/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *labelServidor;
@property (nonatomic, strong) IBOutlet UILabel *labelPorta;
@property (nonatomic, strong) IBOutlet UILabel *labelEmail;
@property (nonatomic, strong) IBOutlet UILabel *labelSenha;
@property (nonatomic, strong) IBOutlet UILabel *labelAutoLogin;
@property (nonatomic, strong) IBOutlet UILabel *labelModo;
@property (nonatomic, strong) IBOutlet UILabel *labelEspaco;

-(IBAction)atualizar:(id)sender;

@end
