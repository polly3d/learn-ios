//
//  LoginViewController.m
//  myUITest
//
//  Created by wang on 15/11/30.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "LoginViewController.h"
#import "MyPopViewController.h"


@interface LoginViewController ()
{
    UITextField *_userInput;
    UITextField *_pwdInput;
}


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
}

- (void)initUI
{
    UILabel *userTxt = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 100, 30)];
    userTxt.text = @"用户名:";
    [self.view addSubview:userTxt];
    
    _userInput = [[UITextField alloc] initWithFrame:CGRectMake(120, 150, 150, 30)];
    [self.view addSubview:_userInput];
    
    UILabel *pwdTxt = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 100, 30)];
    pwdTxt.text = @"密码";
    [self.view addSubview:pwdTxt];
    
    _pwdInput = [[UITextField alloc] initWithFrame:CGRectMake(120, 200, 150, 30)];
    _pwdInput.secureTextEntry = YES;
    [self.view addSubview:_pwdInput];
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(120, 270, 80, 30);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    cancleBtn.frame = CGRectMake(170, 270, 80, 30);
    [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancleBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancleBtn];
}

- (void)loginAction
{
    if([_userInput.text isEqualToString:@"wang"] && [_pwdInput.text isEqualToString:@"123"])
    {
        [self.delegate showUserInfoWith:_userInput.text];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"系统信息" message:@"用户名或密码错误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
