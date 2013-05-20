//
//  UserSample.h
//  BookPersistenceSerializedObject
//
//  Created by André Cocuroci on 20/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserSample : NSObject <NSCoding>

@property (nonatomic, strong) NSString *fieldFirstName;
@property (nonatomic, strong) NSString *fieldLastName;
@property (nonatomic, strong) NSString *fieldEmail;

@end
