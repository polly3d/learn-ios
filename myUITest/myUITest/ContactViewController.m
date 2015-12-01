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

#define ToolBarHeight 44

@interface ContactViewController ()
{
    UIToolbar *_toolbar;
}

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self addToolBar];
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


#pragma mark 添加工具栏
- (void)addToolBar
{
    CGRect frame = self.view.frame;
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, ToolBarHeight)];
    [self.view addSubview:_toolbar];
    
    UIBarButtonItem *removeBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(remove)];
    UIBarButtonItem *flexibleBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    
    NSArray *btnArray = [NSArray arrayWithObjects:removeBtn,flexibleBtn,addBtn, nil];
    _toolbar.items = btnArray;
    
    
    self.navigationItem.rightBarButtonItem = removeBtn;
    
}

#pragma mark - UITableView常用操作
- (void)remove
{
    [_tableView setEditing:!_tableView.isEditing animated:true];
}

- (void)add
{
    
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
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"修改号码" message:[contact getName] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSString *phoneNumber = alert.textFields.firstObject.text;
        [self changePhoneNumber:phoneNumber];
        
    }];
    [alert addAction:cancel];
    [alert addAction:sure];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textfield){
        textfield.text = contact.phoneNumber;
    }];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)changePhoneNumber:(NSString *)phoneNumber
{
    ContactGroup *group = self.contacts[self.selectedIndexPath.section];
    Contact *contact = group.contacts[self.selectedIndexPath.row];
    contact.phoneNumber = phoneNumber;
    NSArray *indexPaths = @[self.selectedIndexPath];
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
}

@end
