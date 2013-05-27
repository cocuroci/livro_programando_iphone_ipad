//
//  ViewController.m
//  BookCoreMotion
//
//  Created by André Cocuroci on 27/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.myMotionManager = [[CMMotionManager alloc] init];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [self resetMaxValues];
    
    if(self.myMotionManager.accelerometerAvailable)
    {
        self.myMotionManager.accelerometerUpdateInterval = 1.0/10.0;
        [self.myMotionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            
            if(error)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Erro ao iniciar acelerômetro" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            }
            else
            {
                NSString *accTextX = [NSString stringWithFormat:@"%+.3f", accelerometerData.acceleration.x];
                NSString *accTextY = [NSString stringWithFormat:@"%+.3f", accelerometerData.acceleration.y];
                NSString *accTextZ = [NSString stringWithFormat:@"%+.3f", accelerometerData.acceleration.z];
                
                [self.labelAccelerometerX performSelectorOnMainThread:@selector(setText:) withObject:accTextX waitUntilDone:YES];
                [self.labelAccelerometerY performSelectorOnMainThread:@selector(setText:) withObject:accTextY waitUntilDone:YES];
                [self.labelAccelerometerZ performSelectorOnMainThread:@selector(setText:) withObject:accTextZ waitUntilDone:YES];
            }
            
        }];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Sem acelerômetro" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
    
    if(self.myMotionManager.gyroAvailable)
    {
        self.myMotionManager.gyroUpdateInterval = 1.0/10.0;
        [self.myMotionManager startGyroUpdatesToQueue:queue withHandler:^(CMGyroData *gyroData, NSError *error) {
            
            if(error)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Erro ao iniciar giroscópio" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            }
            else
            {
                NSString *gyroTextX = [NSString stringWithFormat:@"%+.3f", gyroData.rotationRate.x];
                NSString *gyroTextY = [NSString stringWithFormat:@"%+.3f", gyroData.rotationRate.y];
                NSString *gyroTextZ = [NSString stringWithFormat:@"%+.3f", gyroData.rotationRate.z];
                
                [self.labelGyroscopeX performSelectorOnMainThread:@selector(setText:) withObject:gyroTextX waitUntilDone:YES];
                [self.labelGyroscopeY performSelectorOnMainThread:@selector(setText:) withObject:gyroTextY waitUntilDone:YES];
                [self.labelGyroscopeZ performSelectorOnMainThread:@selector(setText:) withObject:gyroTextZ waitUntilDone:YES];
                
                if(gyroData.rotationRate.x > [self.labelMaxGyroscopeX.text doubleValue])
                {
                    [self.labelMaxGyroscopeX performSelectorOnMainThread:@selector(setText:) withObject:gyroTextX waitUntilDone:YES];
                }
                
                if(gyroData.rotationRate.y > [self.labelMaxGyroscopeY.text doubleValue])
                {
                    [self.labelMaxGyroscopeY performSelectorOnMainThread:@selector(setText:) withObject:gyroTextY waitUntilDone:YES];
                }
                
                if(gyroData.rotationRate.z > [self.labelMaxGyroscopeZ.text doubleValue])
                {
                    [self.labelMaxGyroscopeZ performSelectorOnMainThread:@selector(setText:) withObject:gyroTextZ waitUntilDone:YES];
                }
            }
            
        }];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Sem giroscópio" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
}

-(IBAction)resetMaxValues
{
    self.labelMaxGyroscopeX.text = @"0";
    self.labelMaxGyroscopeY.text = @"0";
    self.labelMaxGyroscopeZ.text = @"0";
}

-(BOOL)shouldAutorotate
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
