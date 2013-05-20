//
//  ViewController.m
//  BookPersistencePropertieList
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
    
    NSString *filepath = [self getFilePath];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filepath])
    {
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filepath];
        
        self.fieldFirstName.text = [array objectAtIndex:0];
        self.fieldLastName.text = [array objectAtIndex:1];
        self.fieldEmail.text = [array objectAtIndex:2];
        
        NSLog(@"Já existe: %@", array);
    } else {
        [[NSFileManager defaultManager] createFileAtPath:[self getFilePath] contents:nil attributes:nil];
        
        NSLog(@"não existe");
    }

    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActiveNotificationFunctions:) name:UIApplicationWillResignActiveNotification object:app];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)getFilePath;
{
    NSArray *userDomainPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE);
    
    NSString *documentsDir = [userDomainPaths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:@"myFile.plist"];
}

-(void)applicationWillResignActiveNotificationFunctions:(NSNotification *)notification
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    [array addObject:self.fieldFirstName.text];
    [array addObject:self.fieldLastName.text];
    [array addObject:self.fieldEmail.text];
    
    BOOL salvo = [array writeToFile:[self getFilePath] atomically:TRUE];
    
    NSLog(@"ARQUIVO salvo: %d", salvo);
}

@end
