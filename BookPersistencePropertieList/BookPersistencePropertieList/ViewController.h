//
//  ViewController.h
//  BookPersistencePropertieList
//
//  Created by André Cocuroci on 20/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *fieldFirstName;
@property (nonatomic, strong) IBOutlet UITextField *fieldLastName;
@property (nonatomic, strong) IBOutlet UITextField *fieldEmail;

-(NSString *)getFilePath;
-(void)applicationWillResignActiveNotificationFunctions:(NSNotification *)notification;

@end
