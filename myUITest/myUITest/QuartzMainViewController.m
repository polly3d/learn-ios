//
//  QuartzMainViewController.m
//  myUITest
//
//  Created by wang on 15/12/1.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "QuartzMainViewController.h"
#import "QuartzItem.h"

@interface QuartzMainViewController ()

@end

@implementation QuartzMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
}

- (void)initData
{
    QuartzItem *item1 = [[QuartzItem alloc] initWithItemName:@"基本图形绘制" className:@"BaseDrawViewController"];
    
    self.controllersData = [NSArray arrayWithObjects:item1, nil];
}

- (void)initUI
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    self.title = @"Quartz 2D";
}

#pragma mark - 数据源方法
#pragma mark 返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.controllersData.count;
}

#pragma mark 返回每行单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuartzItem *item = self.controllersData[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = item.itemName;
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuartzItem *item = self.controllersData[indexPath.row];
    Class controllerClass = NSClassFromString(item.itemClassName);
    id theController = [[controllerClass alloc] init];
    
    //模态显示
    //[self presentViewController:theController animated:YES completion:nil];
    
    //导航切换
//    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.backBarButtonItem = back;
    [self.navigationController pushViewController:theController animated:YES];
    
}

@end
