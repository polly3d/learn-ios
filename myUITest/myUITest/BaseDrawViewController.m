//
//  BaseDrawViewController.m
//  myUITest
//
//  Created by wang on 15/12/1.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "BaseDrawViewController.h"
#import "BaseDrawView.h"

@interface BaseDrawViewController ()

@end

@implementation BaseDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitle:@"基本图形绘制"];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.topItem.backBarButtonItem = back;
    
    CGRect viewRect = CGRectMake(0, 70, self.view.bounds.size.width, self.view.bounds.size.height - 70);
    BaseDrawView *view = [[BaseDrawView alloc] initWithFrame:viewRect];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}



@end
