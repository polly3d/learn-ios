//
//  GCDSerialViewController.m
//  ThreadTest
//
//  Created by wang on 15/12/6.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "GCDSerialViewController.h"

@interface GCDSerialViewController ()
{
    NSMutableArray *_imageViews;
    NSMutableArray *_imageNames;
    
}
@end

@implementation GCDSerialViewController

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
    dispatch_queue_t serialQueue = dispatch_queue_create("myThreadQueue1", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 15; i++) {
        dispatch_async(serialQueue, ^{
            [self loadImage:[NSNumber numberWithInt:i]];
        });
    }
}

- (void)loadImage:(NSNumber *)index
{
    int i = [index integerValue];
    
    int randomNum = (arc4random() % 9) + 1;
    NSString *path = [NSString stringWithFormat:@"http://images.apple.com/v/watch/g/images/home/design_0%i_large.jpg",randomNum];
    
    
    NSURL *url = [NSURL URLWithString:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
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
