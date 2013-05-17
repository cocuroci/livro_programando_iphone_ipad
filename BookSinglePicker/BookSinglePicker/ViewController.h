//
//  ViewController.h
//  BookSinglePicker
//
//  Created by André Cocuroci on 17/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *myPickerData;
}

@property (nonatomic, strong) IBOutlet UIPickerView *mySinglePicker;

- (IBAction)showValue;

@end
