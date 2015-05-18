//
//  FetchTableDataSource.h
//  CoreDataDemo
//
//  Created by huangwenchen on 15/5/12.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

typedef UITableViewCell *(^ConfigureCell)(UITableView * tableview,NSIndexPath * indexpath,NSManagedObject * object);

@interface FetchTableHelper : NSObject<UITableViewDataSource,NSFetchedResultsControllerDelegate>
-(instancetype)initWithFetchController:(NSFetchedResultsController *)fetchresultcontroller Tableview:(UITableView *) tableview Configure:(ConfigureCell)block;
@end
