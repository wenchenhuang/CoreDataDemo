//
//  Employee+Action.m
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/12.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "Employee+Action.h"

@implementation Employee (Action)

+(NSString *)entityName{
    return @"Employee";
}

+(Employee *)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *) context{
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}

@end
