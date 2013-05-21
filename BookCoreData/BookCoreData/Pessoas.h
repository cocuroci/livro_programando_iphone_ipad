//
//  Pessoas.h
//  BookCoreData
//
//  Created by André Cocuroci on 21/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Pessoas : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * sobrenome;

@end
