//
//  MultiThreadViewController.m
//  ThreadTest
//
//  Created by wang on 15/12/6.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MultiThreadViewController.h"
#import "ImageData.h"

@interface MultiThreadViewController ()
{
    NSMutableArray *_imageViews;
}

@end

@implementation MultiThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    _imageViews = [NSMutableArray array];
    
    for(int i = 0;i < 5;i++)
    {
        for(int j = 0;j < 3; j++)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(j * 100, i * 100, 100, 100)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.view addSubview:imageView];
            [_imageViews addObject:imageView];
        }
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 500, 220, 25);
    [btn setTitle:@"加载图片" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)loadImageWithMultiThread
{
    for (int i = 0; i < 5 * 3; i++) {
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadImage:) object:[NSNumber numberWithInt:i]];
        thread.name = [NSString stringWithFormat:@"myThread%i",i];
        [thread start];
    }
}

- (void)loadImage:(NSNumber *)index
{
    int i = [index integerValue];
    
    if(i != 14)
    {
        [NSThread sleepForTimeInterval:2.0];
    }
    
    int randomNum = (arc4random() % 9) + 1;
    NSString *path = [NSString stringWithFormat:@"http://images.apple.com/v/watch/g/images/home/design_0%i_large.jpg",randomNum];
   
    //NSLog(@"%@",path);
    
    NSURL *url = [NSURL URLWithString:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    ImageData *imageData = [[ImageData alloc] init];
    imageData.index = i;
    imageData.data = data;
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:imageData waitUntilDone:YES];
}

- (void)updateImage:(ImageData *)imageData
{
    UIImage *image = [UIImage imageWithData:imageData.data];
    UIImageView *imageView = _imageViews[imageData.index];
    imageView.image = image;
}

@end
