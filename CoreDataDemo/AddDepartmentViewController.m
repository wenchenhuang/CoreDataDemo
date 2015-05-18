//
//  AddDepartmentViewController.m
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/18.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "AddDepartmentViewController.h"

@interface AddDepartmentViewController ()<UITextFieldDelegate>

@end

@implementation AddDepartmentViewController

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
