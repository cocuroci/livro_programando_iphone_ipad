//
//  ViewController.h
//  BookFormAndComponents
//
//  Created by André Cocuroci on 13/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate>

@property (nonatomic, strong) IBOutlet UILabel *myLabel;
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (strong, nonatomic) IBOutlet UILabel *mySliderLabel;
@property (strong, nonatomic) IBOutlet UISlider *mySlider;
@property (strong, nonatomic) IBOutlet UISwitch *mySwitch;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegControl;

- (IBAction)componentUIAlertView;
- (IBAction)componentUIActionSheet:(id)sender;
- (IBAction)componentUILabel:(id)sender;
- (IBAction)componentUITextField:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
- (IBAction)backgrondTouch:(id)sender;
- (IBAction)componentSliderValueChanged:(id)sender;
- (IBAction)componentSwitchChangedValue:(id)sender;
- (IBAction)componentSegChangedValue:(id)sender;

@end
