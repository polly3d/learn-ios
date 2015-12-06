//
//  RefreshViewController.m
//  myUITest
//
//  Created by wang on 15/12/2.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "RefreshViewController.h"
#import "RefreshView.h"

@interface RefreshViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    RefreshView *_view;
    NSArray *_fontSize;
}

@end

@implementation RefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitle:@"视图刷新"];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.topItem.backBarButtonItem = back;
    
    [self initUI];
    [self addPickerView];
}

- (void)initUI
{
    _fontSize = @[@15,@18,@20,@22,@25,@28,@30,@32,@35,@40];
    _view = [[RefreshView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    _view.backgroundColor = [UIColor whiteColor];
    _view.title = @"hello world";
    _view.fontSize = [_fontSize[0] intValue];
    [self.view addSubview:_view];
}

- (void)addPickerView
{
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 250, 320, 268)];
    picker.dataSource = self;
    picker.delegate = self;
    [self.view addSubview:picker];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _fontSize.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%@号字体",_fontSize[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _view.fontSize = [[_fontSize objectAtIndex:row] intValue];
    [_view setNeedsDisplay];
}

@end
