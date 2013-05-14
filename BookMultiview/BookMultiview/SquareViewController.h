//
//  SquareViewController.h
//  BookMultiview
//
//  Created by André Cocuroci on 14/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnotherViewController.h"

@interface SquareViewController : UIViewController

@property (nonatomic,strong) IBOutlet UILabel *myLabel;

-(IBAction)myAction;
-(IBAction)openNewWindow;

@end
