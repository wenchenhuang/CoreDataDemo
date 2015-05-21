//
//  NSString+Action.m
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/19.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "NSString+Action.h"

@implementation NSString (Action)
+(BOOL)isStringValidNumber:(NSString *)str{
    NSCharacterSet * numCharset = [NSCharacterSet decimalDigitCharacterSet];
    return [[str stringByTrimmingCharactersInSet:numCharset] isEqualToString:@""];
}
@end
