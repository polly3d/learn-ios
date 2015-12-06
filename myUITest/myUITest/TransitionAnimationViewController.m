//
//  TransitionAnimationViewController.m
//  myUITest
//
//  Created by wang on 15/12/5.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "TransitionAnimationViewController.h"

@interface TransitionAnimationViewController ()
{
    UIImageView *_imageView;
    int _currentIndex;
}
@end

@implementation TransitionAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = [UIScreen mainScreen].bounds;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = [UIImage imageNamed:@"0.jpg"];
    [self.view addSubview:_imageView];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];
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
    CATransition *transition = [[CATransition alloc] init];
    transition.type = @"cube";
    if(isNext)
    {
        transition.subtype = kCATransitionFromRight;
    }
    else
    {
        transition.subtype = kCATransitionFromLeft;
    }
    
    transition.duration = 1.0f;
    _imageView.image = [self getImage:isNext];
    [_imageView.layer addAnimation:transition forKey:@"TransitionAnimation"];
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
