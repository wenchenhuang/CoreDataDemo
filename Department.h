//
//  Department.h
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/18.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Employee;

@interface Department : NSManagedObject

@property (nonatomic) int32_t  floor;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *employees;
@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addEmployeesObject:(Employee *)value;
- (void)removeEmployeesObject:(Employee *)value;
- (void)addEmployees:(NSSet *)values;
- (void)removeEmployees:(NSSet *)values;

@end
