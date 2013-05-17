//
//  ViewController.h
//  BookDataPicker
//
//  Created by André Cocuroci on 17/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *myDataPicker;

- (IBAction)showValue;
@end
