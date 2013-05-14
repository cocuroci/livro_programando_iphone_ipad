//
//  ViewController.m
//  BookGestures
//
//  Created by André Cocuroci on 14/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressEvent:)];
    longPress.minimumPressDuration = 2;
    longPress.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:longPress];
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent:)];
    tap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tap];
    
    
    
    UISwipeGestureRecognizer *swipeL = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeEvent:)];
    swipeL.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeL];
    
    UISwipeGestureRecognizer *swipeD = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeEvent:)];
    swipeD.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeD];
    
    
    
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationEvent:)];
    [self.view addGestureRecognizer:rotation];
    
    
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchEvent:)];
    [self.view addGestureRecognizer:pinch];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)longPressEvent:(UIGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    
    self.labelStatus.text = [[NSString alloc] initWithFormat:@"Toque longo %.0f,%.0f", location.x, location.y];
}

-(IBAction)tapEvent:(UIGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    
    self.labelStatus.text = [[NSString alloc] initWithFormat:@"Toque duplo curto %.0f,%.0f", location.x, location.y];
}

-(IBAction)swipeEvent:(UIGestureRecognizer *)sender
{
    NSString *direction;    
    UISwipeGestureRecognizer *s = (UISwipeGestureRecognizer *)sender;
    
    if(s.direction == UISwipeGestureRecognizerDirectionLeft) {
        direction = @"esquerda";
    } else if(s.direction == UISwipeGestureRecognizerDirectionRight) {
        direction = @"direita";
    }

    self.labelStatus.text = [[NSString alloc] initWithFormat:@"Toque deslizado (para %@)",direction];
}

-(IBAction)rotationEvent:(UIGestureRecognizer *)sender
{
    CGFloat rotation = [(UIRotationGestureRecognizer *)sender rotation];
    CGFloat velocity = [(UIRotationGestureRecognizer *)sender velocity];
    
    self.labelStatus.text = [[NSString alloc] initWithFormat:@"Rotação: %.5f\u00b0 / %.5f", rotation, velocity];
}

-(IBAction)pinchEvent:(UIGestureRecognizer *)sender
{
    CGFloat scale = [(UIPinchGestureRecognizer *)sender scale];
    CGFloat velocity = [(UIPinchGestureRecognizer *)sender velocity];
    
    self.labelStatus.text = [[NSString alloc] initWithFormat:@"Pinça: %.5f / %.5f", scale, velocity];
}

@end
