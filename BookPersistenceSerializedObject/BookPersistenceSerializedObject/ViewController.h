//
//  ViewController.h
//  BookPersistenceSerializedObject
//
//  Created by André Cocuroci on 20/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserSample.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *fieldFirstName;
@property (strong, nonatomic) IBOutlet UITextField *fieldLastName;
@property (strong, nonatomic) IBOutlet UITextField *fieldEmail;

-(NSString *)getFilepath;
-(void)applicationWillResignActiveNotificationFunctions:(NSNotification *)notification;

@end
