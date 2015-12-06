//
//  ViewController.m
//  ThreadTest
//
//  Created by wang on 15/12/6.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "ViewController.h"
#import "ItemCellData.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_items;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)initData
{
    ItemCellData *item1 = [[ItemCellData alloc] initWithTitle:@"解决线程阻塞" className:@"BaseThreadViewController" isNavigator:YES];
    ItemCellData *item2 = [[ItemCellData alloc] initWithTitle:@"多线程并发" className:@"MultiThreadViewController" isNavigator:YES];
    ItemCellData *item3 = [[ItemCellData alloc] initWithTitle:@"线程状态" className:@"ThreadStateViewController" isNavigator:YES];
    ItemCellData *item4 = [[ItemCellData alloc] initWithTitle:@"线程池" className:@"OperationThreadViewController" isNavigator:YES];
    ItemCellData *item5 = [[ItemCellData alloc] initWithTitle:@"串行队列" className:@"GCDSerialViewController" isNavigator:YES];
    ItemCellData *item6 = [[ItemCellData alloc] initWithTitle:@"并发队列" className:@"GCDParallelViewController" isNavigator:YES];
    ItemCellData *item7 = [[ItemCellData alloc] initWithTitle:@"线程锁问题" className:@"NoLockViewController" isNavigator:YES];
    ItemCellData *item8 = [[ItemCellData alloc] initWithTitle:@"NSLock 线程锁" className:@"MyNSLockViewController" isNavigator:YES];
    ItemCellData *item9 = [[ItemCellData alloc] initWithTitle:@"synchronized线程锁代码" className:@"MyLockBlockViewController" isNavigator:YES];
    _items = @[item1,item2,item3,item4,item5,item6,item7,item8,item9];
}

#pragma mark - tableView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyMainTableViewCell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyMainTableViewCell"];
    }
    ItemCellData *item = _items[indexPath.row];
    cell.textLabel.text = item.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCellData *item = _items[indexPath.row];
    
    Class myClass = NSClassFromString(item.className);
    if(myClass)
    {
        id ctrl = [[myClass alloc] init];
        UIViewController *vc = (UIViewController *)ctrl;
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"功能没有做吧！" message:@"没有做就没做，还乱点" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

@end
