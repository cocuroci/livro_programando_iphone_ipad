//
//  ViewController.h
//  BookCoreMotion
//
//  Created by André Cocuroci on 27/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) CMMotionManager *myMotionManager;

@property (nonatomic, strong) IBOutlet UILabel *labelAccelerometerX;
@property (nonatomic, strong) IBOutlet UILabel *labelAccelerometerY;
@property (nonatomic, strong) IBOutlet UILabel *labelAccelerometerZ;

@property (nonatomic, strong) IBOutlet UILabel *labelGyroscopeX;
@property (nonatomic, strong) IBOutlet UILabel *labelGyroscopeY;
@property (nonatomic, strong) IBOutlet UILabel *labelGyroscopeZ;

@property (nonatomic, strong) IBOutlet UILabel *labelMaxGyroscopeX;
@property (nonatomic, strong) IBOutlet UILabel *labelMaxGyroscopeY;
@property (nonatomic, strong) IBOutlet UILabel *labelMaxGyroscopeZ;

-(IBAction)resetMaxValues;

@end
