//
//  WJContactViewController.m
//  myUITest
//
//  Created by wang on 15/11/29.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "WJContactViewController.h"

@interface WJContactViewController ()
{
    UIButton *_commonBtn;
    UIButton *_baseOperationBtn;
    UIButton *_searchBtn;
}

@end

@implementation WJContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI
{
    
    _commonBtn = [self createBtn:1 withTitle:@"基本列表"];
    _baseOperationBtn = [self createBtn:2 withTitle:@"列表基本操作"];
    _searchBtn = [self createBtn:3 withTitle:@"带搜索的列表"];
    [self.view addSubview:_commonBtn];
    [self.view addSubview:_baseOperationBtn];
    [self.view addSubview:_searchBtn];
    
    [_commonBtn addTarget:self action:@selector(showBaseTableView) forControlEvents:UIControlEventTouchUpInside];
    [_baseOperationBtn addTarget:self action:@selector(showOparationTableView) forControlEvents:UIControlEventTouchUpInside];
    [_searchBtn addTarget:self action:@selector(showSearchTableView) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 弹出窗口方法

- (void)showBaseTableView
{
    NSLog(@"base");
}

- (void)showOparationTableView
{
    NSLog(@"show operation");
}

- (void)showSearchTableView
{
    NSLog(@"show search");
}

#pragma mark 创建按钮对象
- (UIButton *)createBtn:(int)index withTitle:(NSString *)title
{
    UIColor *btnColor = [UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    CGRect btnRect = CGRectMake(0,index * 80, self.view.frame.size.width, 30);
    UIButton *btn = [[UIButton alloc] initWithFrame:btnRect];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:btnColor forState:UIControlStateNormal];
    return btn;
}

@end
