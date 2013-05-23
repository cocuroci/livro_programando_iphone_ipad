//
//  ViewController.m
//  BookBanner
//
//  Created by André Cocuroci on 23/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.b.frame = CGRectOffset(self.b.frame, 0, -50);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)bannerViewWillLoadAd:(ADBannerView *)banner
{   
    if(!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:nil];
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if(self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:nil];
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}

@end
