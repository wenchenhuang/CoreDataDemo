//
//  AddDepartmentViewController.m
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/18.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "AddDepartmentViewController.h"
#import "AnimationHandler.h"

@interface AddDepartmentViewController ()<UITextFieldDelegate>

@end

@implementation AddDepartmentViewController

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(NSArray *)keysOfTextfields{
    return @[@"nameTextfield",@"floorTextfiled"];
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"doneFromAddDepart"]) {
        for (NSString * key in [self keysOfTextfields]) {
            UITextField * textfield = [self valueForKey:key];
            if (textfield.text.length == 0) {
                [AnimationHandler addShakeAnimationWithView:textfield];
                return NO;
            }
        }
    }
    return YES;
}

@end
