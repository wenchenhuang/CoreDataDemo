//
//  Department+Action.h
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/12.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "Department.h"

@interface Department (Action)
+(NSString *)entityName;
+(Department *)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *) context;
-(NSMutableSet *)mutableEmployees;
@end
