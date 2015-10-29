//
//  ChildExampleViewController.m
//  myUITest
//
//  Created by wang on 15/10/29.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "ChildExampleViewController.h"
#import "QuestionAndAnswerView.h"
#import "QuestionItem.h"

@interface ChildExampleViewController ()

@end

@implementation ChildExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    QuestionItem *item = [[QuestionItem alloc] initWithQuestion:@"hello world"];
    QuestionAndAnswerView *view = [QuestionAndAnswerView initWithQuestionItem:item];
    view.frame = CGRectMake(0, 100, view.frame.size.width, view.frame.size.height);
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return @"view";
}

- (UIColor *)colorForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return [UIColor blackColor];
}

- (void)click:(UIButton *)btn
{
    NSLog(@"click");
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
