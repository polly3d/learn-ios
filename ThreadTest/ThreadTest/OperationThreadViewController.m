//
//  OperationThreadViewController.m
//  ThreadTest
//
//  Created by wang on 15/12/6.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "OperationThreadViewController.h"

@interface OperationThreadViewController ()
{
    NSMutableArray *_imageViews;
}

@end

@implementation OperationThreadViewController

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
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    operationQueue.maxConcurrentOperationCount = 5;
    
    for (int i = 0; i < 5 * 3; i++) {
        //方法1：创建操作块添加到队列
        /*NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
            [self loadImage:[NSNumber numberWithInt:i]];
        }];*/
        //[operationQueue addOperation:blockOperation];
        //方法2：直接使用操作队列添加操作
        [operationQueue addOperationWithBlock:^{
            [self loadImage:[NSNumber numberWithInt:i]];
        }];
    }
}

- (void)loadImage:(NSNumber *)index
{
    int i = [index integerValue];
    
    int randomNum = (arc4random() % 9) + 1;
    NSString *path = [NSString stringWithFormat:@"http://images.apple.com/v/watch/g/images/home/design_0%i_large.jpg",randomNum];
    
    
    NSURL *url = [NSURL URLWithString:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self updateImage:data index:i];
    }];
}

- (void)updateImage:(NSData *)data index:(int)index
{
    UIImage *image = [UIImage imageWithData:data];
    UIImageView *imageView = _imageViews[index];
    imageView.image = image;
}


@end
