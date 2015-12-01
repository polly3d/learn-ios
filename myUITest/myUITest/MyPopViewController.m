//
//  MyPopViewController.m
//  myUITest
//
//  Created by wang on 15/11/30.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MyPopViewController.h"
#import "LoginViewController.h"

@interface MyPopViewController ()
{
    UIBarButtonItem *_loginBtn;
    UILabel *_tipLable;
    
    BOOL _isLogin;
}

@end

@implementation MyPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI
{
    _loginBtn = [[UIBarButtonItem alloc]initWithTitle:@"login" style:UIBarButtonItemStylePlain target:self action:@selector(login)];
    self.navigationItem.rightBarButtonItem = _loginBtn;
    
    _tipLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 180, 30)];
    [self.view addSubview:_tipLable];
    _tipLable.text = @"请先登陆";
}

- (void)login
{
    if(!_isLogin)
    {
        LoginViewController *loginController = [[LoginViewController alloc] init];
        loginController.delegate = self;
        [self presentViewController:loginController animated:YES completion:nil];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"这是message" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *loginOut = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
            [self loginOut];
        }];
        [alert addAction:cancelAction];
        [alert addAction:loginOut];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

#pragma mark - 代理方法
- (void)showUserInfoWith:(NSString *)username
{
    _isLogin = YES;
    _loginBtn.title = @"注销";
    _tipLable.text = [NSString stringWithFormat:@"登陆的用户名：%@",username];
}

- (void)loginOut
{
    _isLogin = NO;
    _loginBtn.title = @"登陆";
    _tipLable.text = @"请先登陆";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
