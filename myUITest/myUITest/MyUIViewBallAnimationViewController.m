//
//  MyUIViewBallAnimationViewController.m
//  myUITest
//
//  Created by wang on 15/12/5.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MyUIViewBallAnimationViewController.h"

@interface MyUIViewBallAnimationViewController ()
{
    UIImageView *_imageView;
}
@end

@implementation MyUIViewBallAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ball.png"]];
    _imageView.center = CGPointMake(160, 50);
    [self.view addSubview:_imageView];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
    
    [UIView animateWithDuration:5.0 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        _imageView.center = location;
    }completion:nil];
}


@end
