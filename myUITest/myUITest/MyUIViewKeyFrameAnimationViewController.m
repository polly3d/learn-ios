//
//  MyUIViewKeyFrameAnimationViewController.m
//  myUITest
//
//  Created by wang on 15/12/5.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MyUIViewKeyFrameAnimationViewController.h"

@interface MyUIViewKeyFrameAnimationViewController ()
{
    UIImageView *_imageView;
}
@end

@implementation MyUIViewKeyFrameAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *bg = [UIImage imageNamed:@"background.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bg];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"petal.png"]];
    _imageView.center = CGPointMake(50, 150);
    [self.view addSubview:_imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateKeyframesWithDuration:5.0 delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionCurveLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            _imageView.center = CGPointMake(80.0, 220.0);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
            _imageView.center = CGPointMake(45.0, 300.0);
        }];
    }completion:nil];
}



@end
