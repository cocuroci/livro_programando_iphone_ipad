//
//  ViewController.h
//  BookSMS
//
//  Created by André Cocuroci on 16/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface ViewController : UIViewController <MFMessageComposeViewControllerDelegate>

- (IBAction)sendMessage:(id)sender;

@end
