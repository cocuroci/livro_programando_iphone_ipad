//
//  ViewController.h
//  BookGestures
//
//  Created by André Cocuroci on 14/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *labelStatus;

- (IBAction)longPressEvent:(UIGestureRecognizer *)sender;
- (IBAction)tapEvent:(UIGestureRecognizer *)sender;
- (IBAction)swipeEvent:(UIGestureRecognizer *)sender;
- (IBAction)rotationEvent:(UIGestureRecognizer *)sender;
- (IBAction)pinchEvent:(UIGestureRecognizer *)sender;

@end
