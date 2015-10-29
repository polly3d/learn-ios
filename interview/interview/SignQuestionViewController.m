//
//  SignQuestionViewController.m
//  interview
//
//  Created by wang on 15/10/28.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "SignQuestionViewController.h"


#import "ChildExampleViewController.h"

@interface SignQuestionViewController ()

@end

@implementation SignQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isProgressiveIndicator = YES;
    self.isElasticIndicatorLimit = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)questonArr
{
    if(!_questonArr)
    {
        _questonArr = [[NSArray alloc] init];
    }
    return _questonArr;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    NSMutableArray *childVCArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i++) {
        ChildExampleViewController *child = [[ChildExampleViewController alloc] init];
        [childVCArr addObject:child];
    }
    
    return childVCArr;
}

@end
