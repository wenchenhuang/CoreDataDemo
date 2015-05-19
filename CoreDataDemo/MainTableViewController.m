//
//  MainTableViewController.m
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/12.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "MainTableViewController.h"
#import "FetchTableHelper.h"
#import "Store.h"
#import "Department+Action.h"
#import "Employee+Action.h"
#import "Employee.h"
#import "Department.h"
#import "AddDepartmentViewController.h"
#import "AppDelegate.h"
#import "EmployeesTableViewController.h"
@interface MainTableViewController ()<NSFetchedResultsControllerDelegate>

@property (strong,nonatomic)FetchTableHelper * fetchDataHelper;
@property (strong,nonatomic)NSFetchedResultsController * fetchedResultsController;
@property (strong,nonatomic)Store * store;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate * sharedDelegate = [[UIApplication sharedApplication] delegate];
    sharedDelegate.store = self.store;
    [self.fetchedResultsController performFetch:nil];
    ConfigureCell configblock = ^UITableViewCell *(UITableView *tableview, NSIndexPath *indexpath, NSManagedObject *object) {
        UITableViewCell * cell = [tableview dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexpath];
       Department * department = [self.fetchedResultsController objectAtIndexPath:indexpath];
        cell.textLabel.text = [NSString stringWithFormat:@"Floor: %ld",(long)department.floor.integerValue];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Number of employees: %ld",(long)department.employees.count];
        return cell;
    };
    
    self.fetchDataHelper = [[FetchTableHelper alloc] initWithFetchController:self.fetchedResultsController Tableview:self.tableView Configure:configblock];
    self.tableView.dataSource = self.fetchDataHelper;
    self.fetchedResultsController.delegate = self.fetchDataHelper;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

-(NSFetchedResultsController *)fetchedResultsController{
    if (!_fetchedResultsController) {
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:[Department entityName] inManagedObjectContext:[self managedcontext]];
        [fetchRequest setEntity:entity];
        // Specify how the fetched objects should be sorted
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                                       ascending:YES];
        [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                        managedObjectContext:[self managedcontext]
                                                                          sectionNameKeyPath:@"name" cacheName:@"DemoCache"];
    }
    return _fetchedResultsController;
}
-(NSManagedObjectContext *)managedcontext{
    return self.store.managedObjectContext;
}
-(Store *)store{
    if (!_store) {
        _store = [[Store alloc] init];
    }
    return _store;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"segueToEmployees" sender:indexPath];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"segueToEmployees"]) {
//        NSManagedObjectContext * childManagedContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//        [childManagedContext setParentContext:[self managedcontext]];
        NSIndexPath * path = [self.tableView indexPathForSelectedRow];
        EmployeesTableViewController * dvc = segue.destinationViewController;
        Department * department = (Department *)[self.fetchedResultsController objectAtIndexPath:path];
        dvc.mydepartment = department;
        dvc.managedcontext = [self managedcontext];
    }
}
-(IBAction)unwind:(UIStoryboardSegue *)segue{
    if ([segue.identifier isEqualToString:@"doneFromAddDepart"]) {
        AddDepartmentViewController * svc = (AddDepartmentViewController * )segue.sourceViewController;
            Department * department = [Department insertNewObjectInManagedObjectContext:[self managedcontext]];
            department.name = svc.nameTextfield.text;
            department.floor = @(svc.floorTextfiled.text.intValue);
    }
}

-(NSArray*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction * action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        Department * department = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [[self managedcontext] deleteObject:department];
    }];
    
    UITableViewRowAction * action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Edit" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
    }];
    action2.backgroundColor = [UIColor greenColor];
    return @[action1,action2];
}


@end
