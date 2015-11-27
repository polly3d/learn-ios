//
//  WeiBoViewController.m
//  myUITest
//
//  Created by wang on 15/11/26.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "WeiBoViewController.h"
#import "WeiboData.h"
#import "WeiboTableViewCell.h"

@interface WeiBoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_data;
    NSMutableArray *_weiboCells;
}
@end

@implementation WeiBoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)initData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"weiboData" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    _data = [[NSMutableArray alloc] init];
    _weiboCells = [[NSMutableArray alloc] init];
    [array enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL *stop){
        [_data addObject:[WeiboData initWithDictionary:obj]];
        WeiboTableViewCell *cell = [[WeiboTableViewCell alloc] init];
        [_weiboCells addObject:cell];
    }];
}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    WeiboTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[WeiboTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    WeiboData *data = _data[indexPath.row];
    cell.data = data;
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboTableViewCell *cell = _weiboCells[indexPath.row];
    cell.data = _data[indexPath.row];
    return cell.height;
}

@end
