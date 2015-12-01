//
//  QuartzMainViewController.h
//  myUITest
//
//  Created by wang on 15/12/1.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuartzMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *controllersData;

@end
