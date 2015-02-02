//
//  ViewController.m
//  MagicalRecordDemo
//
//  Created by Deepak on 02/02/15.
//  Copyright (c) 2015 Deepak. All rights reserved.
//

#import "ViewController.h"
#import "CoreData+MagicalRecord.h"
#import "Student.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
- (IBAction)btnSaveAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSaveAction:(id)sender
{
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext)
    {
        [Student saveStudentRecord:nil context:localContext];
    }
    completion:^(BOOL success, NSError *error)
    {
        NSArray *peopleSorted = [Student MR_findAllSortedBy:@"rollNo"
                                                 ascending:YES];
        NSLog(@"Saved Successfully:%lu object ",(unsigned long)peopleSorted.count);

    }];
}
@end
