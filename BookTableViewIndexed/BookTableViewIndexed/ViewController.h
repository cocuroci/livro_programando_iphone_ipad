//
//  ViewController.h
//  BookTableViewIndexed
//
//  Created by André Cocuroci on 15/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSDictionary *musicalGroups;
    NSArray *keysOfMusicalGroups;
}

@end
