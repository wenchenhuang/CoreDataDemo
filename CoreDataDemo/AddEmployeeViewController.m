//
//  AddEmployeeViewController.m
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/18.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "AddEmployeeViewController.h"

@interface AddEmployeeViewController ()<UITextFieldDelegate>

@end

@implementation AddEmployeeViewController
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
