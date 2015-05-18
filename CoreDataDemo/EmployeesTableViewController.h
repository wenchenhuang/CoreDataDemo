//
//  EmployeesTableViewController.h
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/18.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Department.h"
#import "Employee+Action.h"
#import "Employee.h"
@interface EmployeesTableViewController : UITableViewController

@property (strong,nonatomic)Department * mydepartment;
@property (strong,nonatomic)NSManagedObjectContext * managedcontext;
@end
