//
//  ViewController.h
//  BookBanner
//
//  Created by André Cocuroci on 23/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController <ADBannerViewDelegate>

@property (nonatomic) BOOL bannerIsVisible;
@property (strong, nonatomic) IBOutlet ADBannerView *b;

@end
