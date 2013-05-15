//
//  ViewController.h
//  BookTableView
//
//  Created by André Cocuroci on 14/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *myDataSource;
@property (strong, nonatomic) IBOutlet UITableViewCell *myCustomCell;

@end
