//
//  ViewController.h
//  BookCoreData
//
//  Created by André Cocuroci on 21/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *myValues;
}

@property (nonatomic, strong) IBOutlet UITextField *myFirstName;
@property (nonatomic, strong) IBOutlet UITextField *myLastName;
@property (nonatomic, strong) IBOutlet UITableView *myTableView;

-(IBAction)addNewValue;
-(IBAction)readValues;
-(IBAction)textFieldReturn:(id)sender;

@end
