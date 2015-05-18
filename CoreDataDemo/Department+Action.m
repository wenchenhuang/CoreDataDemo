//
//  Department+Action.m
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/12.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "Department+Action.h"

@implementation Department (Action)

+(NSString *)entityName{
    return @"Department";
}

+(Department *)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *) context{
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}

@end
