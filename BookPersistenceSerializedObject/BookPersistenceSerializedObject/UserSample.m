//
//  UserSample.m
//  BookPersistenceSerializedObject
//
//  Created by André Cocuroci on 20/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "UserSample.h"

@implementation UserSample

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.fieldFirstName forKey:@"fieldFirstNameKey"];
    [aCoder encodeObject:self.fieldLastName forKey:@"fieldLastNameKey"];
    [aCoder encodeObject:self.fieldEmail forKey:@"fieldEmailKey"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        self.fieldFirstName = [aDecoder decodeObjectForKey:@"fieldFirstNameKey"];
        self.fieldLastName = [aDecoder decodeObjectForKey:@"fieldLastNameKey"];
        self.fieldEmail = [aDecoder decodeObjectForKey:@"fieldEmailKey"];
    }
    
    return self;
}

@end
