//
//  AddEmployeeViewController.m
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/18.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "AddEmployeeViewController.h"
#import "AnimationHandler.h"
#import "NSString+Action.h"
@interface AddEmployeeViewController ()<UITextFieldDelegate>

@end

@implementation AddEmployeeViewController
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(NSArray *)keysOfTextfields{
    return @[@"nameTextfield",@"idTextfield"];
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"unwindFromDone"]) {
        for (NSString * key in [self keysOfTextfields]) {
            UITextField * textfield = [self valueForKey:key];
            if (textfield.text.length == 0) {
                [AnimationHandler addShakeAnimationWithView:textfield];
                return NO;
            }
        }
        if (self.idTextfield.text.length == 0 || ![NSString isStringValidNumber:self.ageTextfield.text]) {
           UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Title" message:@"Age should be number" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
            [AnimationHandler addShakeAnimationWithView:self.ageTextfield];
            return NO;
        }
    }
    return YES;
}
@end
