//
//  ViewController.h
//  BookMultiPicker
//
//  Created by André Cocuroci on 17/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *myPickerData;
    NSArray *myPickerDataFlavours;
}

@property (nonatomic, strong) IBOutlet UIPickerView *myMultiPicker;
@property (nonatomic, strong) NSArray *myPickerData;
@property (nonatomic, strong) NSArray *myPickerDataFlavours;

-(IBAction)showValue;

@end
