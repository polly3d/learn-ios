//
//  ToDoListTableViewController.h
//  AppleToDoList
//
//  Created by wang on 15/9/17.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListTableViewController : UITableViewController

@property (strong,nonatomic) NSMutableArray *itemsList;
- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
