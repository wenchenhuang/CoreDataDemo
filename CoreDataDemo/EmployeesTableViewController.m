//
//  EmployeesTableViewController.m
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/18.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "EmployeesTableViewController.h"
#import "AddEmployeeViewController.h"
@interface EmployeesTableViewController ()

@end

@implementation EmployeesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


-(NSMutableArray *)persons{
    return [NSMutableArray arrayWithArray:[self.mydepartment.employees allObjects]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self persons] count];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Employee * employee = [[self persons] objectAtIndex:indexPath.row];
    UILabel * namelabel = (UILabel *)[cell viewWithTag:11];
    namelabel.text = employee.name;
    UILabel * agelabel = (UILabel *)[cell viewWithTag:12];
    agelabel.text = [NSString stringWithFormat:@"%ld",(long)employee.age.integerValue];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    UILabel * birthdaylabel = (UILabel *)[cell viewWithTag:13];
    birthdaylabel.text = [dateFormatter stringFromDate:employee.birthday];
    return cell;
}

-(IBAction)unwind:(UIStoryboardSegue *)segue{
    if ([segue.identifier isEqualToString:@"unwindFromDone"]) {
        AddEmployeeViewController * svc = segue.sourceViewController;
        Employee * employee = [Employee insertNewObjectInManagedObjectContext:self.managedcontext];
        employee.name = svc.nameTextfield.text;
        employee.age = @(svc.ageTextfield.text.intValue);
        employee.birthday = svc.brithdayDatePicker.date;
        employee.department = self.mydepartment;
        [self.tableView reloadData];
    }
}
-(NSArray*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction * action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        Employee * employee = [[self persons] objectAtIndex:indexPath.row];
        [self.mydepartment removeEmployeesObject:employee];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
    }];
    
    UITableViewRowAction * action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Edit" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        //Action 2
        
    }];
    action2.backgroundColor = [UIColor greenColor];
    return @[action1,action2];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
