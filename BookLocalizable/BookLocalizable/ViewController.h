//
//  ViewController.h
//  BookLocalizable
//
//  Created by André Cocuroci on 17/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *myLabel;
@property (nonatomic, strong) IBOutlet UITextField *myTextField;
@property (nonatomic, strong) IBOutlet UIButton *myButton;

-(IBAction)process;
-(IBAction)textFieldReturn:(id)sender;

@end
