//
//  AppDelegate.h
//  todoList
//
//  Created by wang on 15/9/10.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITableViewDataSource>
{
	UITableView *taskTable;
	UITextField *taskField;
	UIButton *insertButton;

	NSMutableArray *tasks;
}

- (void)addTask:(id)sender;

@property (strong, nonatomic) UIWindow *window;


@end

