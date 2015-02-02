//
//  Student.h
//  MagicalRecordDemo
//
//  Created by Deepak on 02/02/15.
//  Copyright (c) 2015 Deepak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * rollNo;
@property (nonatomic, retain) NSString * name;

+(void)saveStudentRecord:(NSMutableArray *)arrData context:(NSManagedObjectContext *)context;
@end
