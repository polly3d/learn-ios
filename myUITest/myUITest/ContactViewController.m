//
//  ContactViewController.m
//  myUITest
//
//  Created by wang on 15/11/25.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "ContactViewController.h"
#import "Contact.h"
#import "ContactGroup.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (void)initData
{
    self.contacts = [[NSMutableArray alloc] init];
    
    Contact *contact1 = [Contact initWithFirstName:@"wang" lastName:@"jin" phoneNumber:@"1380013800"];
    Contact *contact2 = [Contact initWithFirstName:@"wang" lastName:@"hua hua" phoneNumber:@"1380013800"];
    ContactGroup *group1 = [[ContactGroup alloc] initWithName:@"w" detail:@"with name beginning with w" contacts:[NSMutableArray arrayWithObjects:contact1,contact2,nil]];
    [self.contacts addObject:group1];
    Contact *contact3 = [Contact initWithFirstName:@"li" lastName:@"jin" phoneNumber:@"1380013800"];
    Contact *contact4 = [Contact initWithFirstName:@"li" lastName:@"hua hua" phoneNumber:@"1380013800"];
    ContactGroup *group2 = [[ContactGroup alloc] initWithName:@"l" detail:@"with name beginning with l" contacts:[NSMutableArray arrayWithObjects:contact3,contact4,nil]];
    [self.contacts addObject:group2];
    Contact *contact5 = [Contact initWithFirstName:@"xie" lastName:@"jin" phoneNumber:@"1380013800"];
    Contact *contact6 = [Contact initWithFirstName:@"xie" lastName:@"hua hua" phoneNumber:@"1380013800"];
    Contact *contact7 = [Contact initWithFirstName:@"xie" lastName:@"hua hua" phoneNumber:@"1380013800"];
    Contact *contact8 = [Contact initWithFirstName:@"xie" lastName:@"hua hua" phoneNumber:@"1380013800"];
    Contact *contact9 = [Contact initWithFirstName:@"xie" lastName:@"hua hua" phoneNumber:@"1380013800"];
    Contact *contact10 = [Contact initWithFirstName:@"xie" lastName:@"hua hua" phoneNumber:@"1380013800"];
    Contact *contact11 = [Contact initWithFirstName:@"xie" lastName:@"hua hua" phoneNumber:@"1380013800"];
    Contact *contact12 = [Contact initWithFirstName:@"xie" lastName:@"hua hua" phoneNumber:@"1380013800"];
    ContactGroup *group3 = [[ContactGroup alloc] initWithName:@"x" detail:@"with name beginning with x" contacts:[NSMutableArray arrayWithObjects:contact5,contact6,contact7,contact8,contact9,contact10,contact11,contact12,nil]];
    [self.contacts addObject:group3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.contacts.count;
}

#pragma mark 返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ContactGroup *group = self.contacts[section];
    return group.contacts.count;
}

#pragma mark 返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContactGroup *group = self.contacts[indexPath.section];
    Contact *contact = group.contacts[indexPath.row];
    
    //由于此方法调用十分频繁，cell的标示声明成静态变量
    static NSString *cellIdentifier = @"UITableViewKey";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    }
    cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    return cell;
}

#pragma mark 返回每组头标题名称
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ContactGroup *group = self.contacts[section];
    return group.name;
}

#pragma mark 返回每组尾部说明
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    ContactGroup *group = self.contacts[section];
    return group.detail;
}

#pragma mark 返回每组标题索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *index = [[NSMutableArray alloc] init];
    for(ContactGroup *group in self.contacts)
    {
        [index addObject:group.name];
    }
    return index;
}

#pragma mark - 代理方法
#pragma mark 设置分组标题内容高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 50;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    ContactGroup *group = self.contacts[indexPath.section];
    Contact *contact = group.contacts[indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"system info" message:[contact getName] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *txt = [alert textFieldAtIndex:0];
    txt.text = contact.phoneNumber;
    [alert show];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        UITextField *txt = [alertView textFieldAtIndex:0];
        ContactGroup *group = self.contacts[self.selectedIndexPath.section];
        Contact *contact = group.contacts[self.selectedIndexPath.row];
        contact.phoneNumber = txt.text;
        
        //刷新表格
        NSArray *indexPaths = @[self.selectedIndexPath];
        [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
    }
}


@end
