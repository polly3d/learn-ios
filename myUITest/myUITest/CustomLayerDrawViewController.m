//
//  CustomLayerDrawViewController.m
//  myUITest
//
//  Created by wang on 15/12/3.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "CustomLayerDrawViewController.h"
#import "CustomView.h"

@interface CustomLayerDrawViewController ()

@end

@implementation CustomLayerDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomView *view = [[CustomView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}



@end
