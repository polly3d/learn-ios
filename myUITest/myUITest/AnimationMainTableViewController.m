//
//  AnimationMainTableViewController.m
//  myUITest
//
//  Created by wang on 15/12/3.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "AnimationMainTableViewController.h"
#import "MainItem.h"

@interface AnimationMainTableViewController ()
{
    NSArray *_items;
}

@end

@implementation AnimationMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initData];
}

- (void)initData
{
    MainItem *item1 = [[MainItem alloc] initWithTitle:@"CALayer简单属性" className:@"BaseLayerViewController" isNavigator:YES];
    MainItem *item2 = [[MainItem alloc] initWithTitle:@"CALayer绘图——圆形图片" className:@"DrawWithLayerViewController" isNavigator:YES];
    MainItem *item3 = [[MainItem alloc] initWithTitle:@"CALayer自定义图层绘图" className:@"CustomLayerDrawViewController" isNavigator:YES];
    MainItem *item4 = [[MainItem alloc] initWithTitle:@"CABasicAnimation简单动画" className:@"BaseAnimationViewController" isNavigator:YES];
    MainItem *item5 = [[MainItem alloc] initWithTitle:@"关键帧动画" className:@"KeyframeAnimationViewController" isNavigator:YES];
    MainItem *item6 = [[MainItem alloc] initWithTitle:@"动画组" className:@"GroupAnimationViewController" isNavigator:YES];
    MainItem *item7 = [[MainItem alloc] initWithTitle:@"转场动画" className:@"TransitionAnimationViewController" isNavigator:YES];
    MainItem *item8 = [[MainItem alloc] initWithTitle:@"逐帧动画" className:@"FrameByFrameViewController" isNavigator:YES];
    MainItem *item9 = [[MainItem alloc] initWithTitle:@"UIView封装——基础动画" className:@"MyUIViewBaseAnimationViewController" isNavigator:YES];
    MainItem *item10 = [[MainItem alloc] initWithTitle:@"UIView封装——弹簧效果" className:@"MyUIViewBallAnimationViewController" isNavigator:YES];
    MainItem *item11 = [[MainItem alloc] initWithTitle:@"UIView封装——关键帧动画" className:@"MyUIViewKeyFrameAnimationViewController" isNavigator:YES];
    MainItem *item12 = [[MainItem alloc] initWithTitle:@"UIView封装——转场动画" className:@"MyUIViewTransitionAnimationViewController" isNavigator:YES];
    _items = @[item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnimationTableViewCell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AnimationTableViewCell"];
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
        
        //所有的vc背景都设置为白色
        //UIViewController *vCtrl = (UIViewController *)ctrl;
        //vCtrl.view.backgroundColor = [UIColor whiteColor];
        
        
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
