//
//  MyLockBlockViewController.m
//  ThreadTest
//
//  Created by wang on 15/12/6.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MyLockBlockViewController.h"

@interface MyLockBlockViewController ()
{
    NSMutableArray *_imageViews;
    NSMutableArray *_imageNames;
}
@end

@implementation MyLockBlockViewController

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
    
    _imageNames = [NSMutableArray array];
    for (int i = 1; i < 10; i++) {
        [_imageNames addObject:[NSString stringWithFormat:@"http://images.apple.com/v/watch/g/images/home/design_0%i_large.jpg",i]];
    }
}

- (void)loadImageWithMultiThread
{
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i = 0; i < 15; i++) {
        dispatch_async(globalQueue, ^{
            [self loadImage:[NSNumber numberWithInt:i]];
        });
    }
}

- (void)loadImage:(NSNumber *)index
{
    int i = [index integerValue];
    
    NSData *data;
    NSString *name;
    
    //线程同步
    @synchronized(self)
    {
        if(_imageNames.count > 0)
        {
            name = [_imageNames lastObject];
            [_imageNames removeObject:name];
        }
    }
    
    
    
    if(name)
    {
        NSURL *url = [NSURL URLWithString:name];
        data = [NSData dataWithContentsOfURL:url];
    }
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_sync(mainQueue, ^{
        [self updateImage:data index:i];
    });
}

- (void)updateImage:(NSData *)data index:(int)index
{
    UIImage *image = [UIImage imageWithData:data];
    UIImageView *imageView = _imageViews[index];
    imageView.image = image;
}


@end
