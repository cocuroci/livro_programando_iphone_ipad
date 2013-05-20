//
//  ViewController.m
//  BookPersistenceSerializedObject
//
//  Created by André Cocuroci on 20/05/13.
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
    
    NSString *filepath = [self getFilepath];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filepath])
    {
        NSData *data = [[NSData alloc] initWithContentsOfFile:filepath];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        
        UserSample *user = [unarchiver decodeObjectForKey:@"UserSampleData"];
        [unarchiver finishDecoding];
        
        NSLog(@"User: %@", user);
        
        self.fieldFirstName.text = user.fieldFirstName;
        self.fieldLastName.text = user.fieldLastName;
        self.fieldEmail.text = user.fieldEmail;
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActiveNotificationFunctions:) name:UIApplicationWillResignActiveNotification object:app];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)getFilepath
{
    NSArray *userDomainPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDir = [userDomainPaths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:@"myObject"];
}

-(void)applicationWillResignActiveNotificationFunctions:(NSNotification *)notification
{
    UserSample *userSample = [[UserSample alloc] init];
    userSample.fieldFirstName = self.fieldFirstName.text;
    userSample.fieldLastName = self.fieldLastName.text;
    userSample.fieldEmail = self.fieldEmail.text;
    
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:userSample forKey:@"UserSampleData"];
    [archiver finishEncoding];
    [data writeToFile:[self getFilepath] atomically:YES];
}

@end
