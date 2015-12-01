//
//  SearchContactViewController.m
//  myUITest
//
//  Created by wang on 15/12/1.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "SearchContactViewController.h"
#import "ContactGroup.h"
#import "Contact.h"
#define ToolBarHeight 44
#define SearchBarHeight 44

@interface SearchContactViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    UIToolbar *_toolbar;
}

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) NSMutableArray *searchContacts;
@property (nonatomic) BOOL isSearching;
@property (nonatomic,strong) NSMutableArray *contacts;

@end

@implementation SearchContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initData];
    
    [self addToolBar];
    
    int maxY = CGRectGetMaxY(_toolbar.frame);
    CGRect tableRect = CGRectMake(0, maxY, self.view.bounds.size.width, self.view.bounds.size.height - maxY);
    self.tableView = [[UITableView alloc] initWithFrame:tableRect style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self addSearchBar];
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

#pragma mark 添加工具栏
- (void)addToolBar
{
    CGRect frame = self.view.frame;
    _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 20, frame.size.width, ToolBarHeight)];
    [self.view addSubview:_toolbar];
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelBack)];
    
    NSArray *btnArray = [NSArray arrayWithObjects:cancelBtn, nil];
    _toolbar.items = btnArray;
}

#pragma mark 添加搜索栏
- (void)addSearchBar
{
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, SearchBarHeight);
    self.searchBar = [[UISearchBar alloc] initWithFrame:rect];
    self.searchBar.placeholder = @"请输入查找的内容";
    self.searchBar.showsCancelButton = YES;
    self.searchBar.delegate = self;
    self.tableView.tableHeaderView = self.searchBar;
}



#pragma mark - 视图切换
- (void)cancelBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(_isSearching)
    {
        return 1;
    }
    return self.contacts.count;
}

#pragma mark 返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_isSearching)
    {
        return _searchContacts.count;
    }
    ContactGroup *group = self.contacts[section];
    return group.contacts.count;
}

#pragma mark 返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contact *contact = nil;
    if(_isSearching)
    {
        contact = _searchContacts[indexPath.row];
    }
    else
    {
        ContactGroup *group = self.contacts[indexPath.section];
        contact = group.contacts[indexPath.row];
    }
    
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

#pragma mark - 代理方法
#pragma mark 搜索形成新数据
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    _isSearching = NO;
    _searchBar.text = @"";
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if([self.searchBar.text isEqual:@""])
    {
        _isSearching = NO;
        [self.tableView reloadData];
        return;
    }
    [self searchDataWithKeyWord:self.searchBar.text];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self searchDataWithKeyWord:searchBar.text];
    [self.searchBar resignFirstResponder];
}

- (void)searchDataWithKeyWord:(NSString *)keyWord
{
    _isSearching = YES;
    _searchContacts = [NSMutableArray array];
    [_contacts enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL *stop){
        ContactGroup *group = obj;
        [group.contacts enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL *stop){
            Contact *contact = obj;
            if([contact.firstName.uppercaseString containsString:keyWord.uppercaseString] || [contact.lastName.uppercaseString containsString:keyWord.uppercaseString] || [contact.phoneNumber containsString:keyWord])
            {
                [_searchContacts addObject:contact];
            }
        }];
    }];
    
    [self.tableView reloadData];
}

#pragma mark 设置分组标题内容高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 60;
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

@end
