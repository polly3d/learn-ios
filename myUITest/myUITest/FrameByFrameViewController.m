//
//  FrameByFrameViewController.m
//  myUITest
//
//  Created by wang on 15/12/5.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "FrameByFrameViewController.h"

@interface FrameByFrameViewController ()
{
    CALayer *_layer;
    int _index;
    NSMutableArray *_images;
}
@end

@implementation FrameByFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view.layer.contents = (id)[UIImage imageNamed:@"bg.png"].CGImage;
    
    _layer = [[CALayer alloc] init];
    _layer.bounds = CGRectMake(0, 0, 87, 32);
    _layer.position = CGPointMake(160, 284);
    [self.view.layer addSublayer:_layer];
    
    _images = [[NSMutableArray alloc] init];
    for (int i = 0;i < 10; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"fish%i.jpg",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [_images addObject:image];
    }
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(step)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)step
{
    static int s = 0;
    
    if(++s % 10 == 0)
    {
        UIImage *image = _images[_index];
        _layer.contents = (id)image.CGImage;
        _index = (_index + 1) % 10;
    }
}


@end
