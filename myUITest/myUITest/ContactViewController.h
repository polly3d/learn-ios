//
//  ContactViewController.h
//  myUITest
//
//  Created by wang on 15/11/25.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *contacts;
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;

@end
