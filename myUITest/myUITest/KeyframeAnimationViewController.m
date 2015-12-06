//
//  KeyframeAnimationViewController.m
//  myUITest
//
//  Created by wang on 15/12/4.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "KeyframeAnimationViewController.h"

@interface KeyframeAnimationViewController ()
{
    CALayer *_layer;
}

@end

@implementation KeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backgroundImg = [UIImage imageNamed:@"background.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImg];
    
    _layer = [[CALayer alloc] init];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.contents = (id)[UIImage imageNamed:@"petal.png"].CGImage;
    [self.view.layer addSublayer:_layer];
    
    //[self translationAnimation];
    [self translationWithCurve];
}

#pragma mark 直线路径
- (void)translationAnimation
{
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *key1 = [NSValue valueWithCGPoint:_layer.position];
    NSValue *key2 = [NSValue valueWithCGPoint:CGPointMake(80, 220)];
    NSValue *key3 = [NSValue valueWithCGPoint:CGPointMake(45, 300)];
    NSValue *key4 = [NSValue valueWithCGPoint:CGPointMake(55, 400)];
    NSArray *value = @[key1,key2,key3,key4];
    keyFrameAnimation.values = value;
    keyFrameAnimation.duration = 8;
    keyFrameAnimation.beginTime = CACurrentMediaTime() + 2;
    
    [_layer addAnimation:keyFrameAnimation forKey:@"KeyframeAnimation_position"];
}


#pragma mark 曲线路径
- (void)translationWithCurve
{
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, _layer.position.x, _layer.position.y);
    CGPathAddCurveToPoint(path, nil, 160, 280, -30, 300, 55, 400);
    keyFrameAnimation.path = path;
    CGPathRelease(path);
    
    keyFrameAnimation.duration = 8.0;
    keyFrameAnimation.beginTime = CACurrentMediaTime() + 2;
    
    [_layer addAnimation:keyFrameAnimation forKey:@"keyFrameAnimation_postion"];
    
}

@end
