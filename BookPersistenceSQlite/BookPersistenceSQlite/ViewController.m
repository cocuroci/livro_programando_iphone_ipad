//
//  ViewController.m
//  BookPersistenceSQlite
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
    
    sqlite3 *myDatabase;
    
    if(sqlite3_open([[self getFilepath] UTF8String], &myDatabase) != SQLITE_OK)
    {
        NSAssert(NO, @"Falha na abertura do banco de dados viewDidLoad");
    }
    
    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS FIELDS(FIELD_NAME TEXT PRIMARY KEY, FIELD_DATA TEXT);";
    
    char *errorMsg;
    
    if(sqlite3_exec(myDatabase, [createSQL UTF8String], NULL, NULL, &errorMsg) != SQLITE_OK)
    {
        sqlite3_close(myDatabase);
        NSAssert1(NO, @"Ocorreu um erro: %s", errorMsg);
    }
    
    NSString *query = @"SELECT FIELD_NAME, FIELD_DATA FROM FIELDS";
    sqlite3_stmt *statement;
    
    if(sqlite3_prepare_v2(myDatabase, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        NSArray *fieldNames = @[@"fieldFirstName", @"fieldLastName", @"fieldEmail"];
        
        int count = 0;
        
        while(sqlite3_step(statement) == SQLITE_ROW)
        {
            char *rowData = (char *)sqlite3_column_text(statement, 1);
            
            NSString *fieldName = [fieldNames objectAtIndex:count];
            NSString *fieldValue = [[NSString alloc] initWithUTF8String:rowData];
            
            UITextField *field = [self valueForKey:fieldName];
            field.text = fieldValue;
            
            count++;
        }
        
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(myDatabase);    
    
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
    NSString *documentDirs = [userDomainPaths objectAtIndex:0];
    return [documentDirs stringByAppendingPathComponent:@"myDatabase"];
}

-(void)applicationWillResignActiveNotificationFunctions:(NSNotification *)notification
{
    sqlite3 *myDatabase;
    
    NSLog(@"applicationWillResignActiveNotificationFunctions");
    
    if(sqlite3_open([[self getFilepath] UTF8String], &myDatabase) != SQLITE_OK)
    {
        NSAssert(NO, @"Falha na abertura do banco de dados applicationWillResignActiveNotificationFunctions");
    }
    
    NSArray *fieldNames = @[@"fieldFirstName", @"fieldLastName", @"fieldEmail"];
    
    for(int i = 0; i < 3; i++)
    {
        NSString *fieldName = [fieldNames objectAtIndex:i];
        UITextField *field = [self valueForKey:fieldName];
        
        NSLog(@"values: %@, %@",fieldName, field.text);
       
        char *update = "INSERT OR REPLACE INTO FIELDS (FIELD_NAME, FIELD_DATA) VALUES (?,?)";
        
        sqlite3_stmt *statement;
        
        if(sqlite3_prepare_v2(myDatabase, update, -1, &statement, nil) == SQLITE_OK)
        {
            sqlite3_bind_text(statement, 1, [[fieldNames objectAtIndex:i] UTF8String], -1, NULL);
            sqlite3_bind_text(statement, 2, [field.text UTF8String], -1, NULL);
        }
        
        if(sqlite3_step(statement) != SQLITE_DONE)
        {
            NSAssert1(NO, @"Erro no banco de dados: %s", sqlite3_errmsg(myDatabase));
        }
        
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(myDatabase);
    
}

@end
