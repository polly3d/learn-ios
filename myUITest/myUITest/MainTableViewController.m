//
//  MainTableViewController.m
//  myUITest
//
//  Created by wang on 15/12/3.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainItem.h"

@interface MainTableViewController ()
{
    NSArray *_items;
}

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
}

- (void)initData
{
    MainItem *item1 = [MainItem initWithTitle:@"单图片查看" className:@"SinglePicViewController" isNavigator:YES];
    MainItem *item2 = [MainItem initWithTitle:@"无限图片循环" className:@"PicScrollViewController" isNavigator:YES];
    MainItem *item3 = [MainItem initWithTitle:@"联系人" className:@"WJContactViewController" isNavigator:YES];
    MainItem *item4 = [MainItem initWithTitle:@"仿微博列表" className:@"WeiBoViewController" isNavigator:YES];
    MainItem *item5 = [MainItem initWithTitle:@"模态窗口展示" className:@"MyPopViewController" isNavigator:YES];
    MainItem *item6 = [MainItem initWithTitle:@"触摸事件" className:@"TouchEventViewController" isNavigator:YES];
    MainItem *item7 = [MainItem initWithTitle:@"手势识别" className:@"PhotoGestureViewController" isNavigator:YES];
    MainItem *item8 = [MainItem initWithTitle:@"运动事件" className:@"ShakeViewController" isNavigator:YES];
    MainItem *item9 = [MainItem initWithTitle:@"远程事件控制（耳机事件——暂无）" className:@"" isNavigator:YES];
    MainItem *item10 = [MainItem initWithTitle:@"Quartz 2D 相关" className:@"QuartzMainViewController" isNavigator:YES];
    MainItem *item11 = [MainItem initWithTitle:@"动画相关" className:@"AnimationMainTableViewController" isNavigator:YES];
    
    _items = @[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainTableViewCell"];
    }
    
    MainItem *item = _items[indexPath.row];
    cell.textLabel.text = item.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainItem *item = _items[indexPath.row];
    Class controllerClassName = NSClassFromString(item.className);
    if(controllerClassName)
    {
        id ctrl = [[controllerClassName alloc] init];
        
        if(item.isNavigator)
        {
            [self.navigationController pushViewController:ctrl animated:YES];
        }
        else
        {
            [self presentViewController:ctrl animated:YES completion:nil];
        }
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"骚年，功能还没有" message:@"下次再来看看!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

@end
