//
//  BaseThreadViewController.m
//  ThreadTest
//
//  Created by wang on 15/12/6.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "BaseThreadViewController.h"

@interface BaseThreadViewController ()
{
    UIImageView *_imageView;
}
@end

@implementation BaseThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI
{
    _imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 500, 220, 25);
    [btn setTitle:@"加载图片" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)loadImageWithMultiThread
{
    //创建线程两种方法:
    
    //方法1：使用对象方法
    //NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadImage) object:nil];
    //[thread start];
    
    //方法2：使用类方法
    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
}

- (void)loadImage
{
    NSURL *url = [NSURL URLWithString:@"http://images.apple.com/v/iphone/home/r/home/images/compare_iphones_6s_xlarge.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:data waitUntilDone:YES];
}

- (void)updateImage:(NSData *)imageData
{
    UIImage *image = [UIImage imageWithData:imageData];
    _imageView.image = image;
}

@end
