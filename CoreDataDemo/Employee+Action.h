//
//  Employee+Action.h
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/12.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "Employee.h"

@interface Employee (Action)
+(NSString *)entityName;
+(Employee *)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *) context;
@end
