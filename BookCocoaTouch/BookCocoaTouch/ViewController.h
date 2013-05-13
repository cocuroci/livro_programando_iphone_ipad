//
//  ViewController.h
//  BookCocoaTouch
//
//  Created by André Cocuroci on 13/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UILabel *myLabel;
}

@property (nonatomic, strong) IBOutlet UILabel *myLabel;

- (IBAction)myFirstAction:(id)sender;

@end
