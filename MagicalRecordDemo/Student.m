//
//  Student.m
//  MagicalRecordDemo
//
//  Created by Deepak on 02/02/15.
//  Copyright (c) 2015 Deepak. All rights reserved.
//

#import "Student.h"
#define MR_SHORTHAND
#import "CoreData+MagicalRecord.h"

@implementation Student

@dynamic rollNo;
@dynamic name;

+(void)saveStudentRecord:(NSMutableArray *)arrData context:(NSManagedObjectContext *)context
{
    
    if (!context)
    {
        context = [NSManagedObjectContext defaultContext];
    }
    
    for (int i =1; i<=10; i++) {
        Student *student = [Student getUserWithID:[NSString stringWithFormat:@"%d",i] context:context];
       
        if (!student)
        {
            student         = [Student MR_createEntityInContext:context];
            student.rollNo  = [NSString stringWithFormat:@"%d",i];
            student.name  = [NSString stringWithFormat:@"Student%d",i];

        } else {
            student.rollNo  = [NSString stringWithFormat:@"%d",i];
            student.name  = [NSString stringWithFormat:@"Student%d",i];
        }
    }
}


+ (Student *)getUserWithID:(NSString *)userId context:(NSManagedObjectContext *)context
{
    if (!context)
    {
        context = [NSManagedObjectContext  defaultContext];
    }
    
    Student *student = [Student findFirstByAttribute:@"rollNo" withValue:userId inContext:context];
    
    return student;
}

@end
