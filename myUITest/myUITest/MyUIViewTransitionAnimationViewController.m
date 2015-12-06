//
//  MyUIViewTransitionAnimationViewController.m
//  myUITest
//
//  Created by wang on 15/12/5.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MyUIViewTransitionAnimationViewController.h"

@interface MyUIViewTransitionAnimationViewController ()
{
    UIImageView *_imageView;
    int _currentIndex;
}
@end

@implementation MyUIViewTransitionAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
    _imageView.frame = [UIScreen mainScreen].bounds;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
    UISwipeGestureRecognizer *leftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)];
    leftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftGesture];
    
    UISwipeGestureRecognizer *rightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)];
    rightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightGesture];
}

- (void)leftSwipe:(UISwipeGestureRecognizer *)gesture
{
    [self transitionAnimation:YES];
}

- (void)rightSwipe:(UISwipeGestureRecognizer *)gesture
{
    [self transitionAnimation:NO];
}

- (void)transitionAnimation:(BOOL)isNext
{
    UIViewAnimationOptions option;
    if(isNext)
    {
        option = UIViewAnimationOptionCurveLinear | UIViewAnimationOptionTransitionFlipFromRight;
    }
    else
    {
        option = UIViewAnimationOptionCurveLinear | UIViewAnimationOptionTransitionFlipFromLeft;
    }
    [UIView transitionWithView:_imageView duration:1.0 options:option animations:^{
        _imageView.image = [self getImage:isNext];
    }completion:nil];
}

- (UIImage *)getImage:(BOOL)isNext
{
    if(isNext)
    {
        _currentIndex = (_currentIndex + 1) % 5;
    }
    else
    {
        _currentIndex = (_currentIndex - 1 + 5) % 5;
    }
    NSString *imageName = [NSString stringWithFormat:@"%i.jpg",_currentIndex];
    return [UIImage imageNamed:imageName];
}

@end
