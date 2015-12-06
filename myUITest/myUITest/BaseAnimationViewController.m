//
//  BaseAnimationViewController.m
//  myUITest
//
//  Created by wang on 15/12/3.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "BaseAnimationViewController.h"

@interface BaseAnimationViewController ()
{
    CALayer *_layer;
}
@end

@implementation BaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backgImg = [UIImage imageNamed:@"background.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgImg];
    
    _layer = [[CALayer alloc] init];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.contents = (id)[UIImage imageNamed:@"petal.png"].CGImage;
    [self.view.layer addSublayer:_layer];
}

- (void)translationAnimation:(CGPoint)location
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.toValue = [NSValue valueWithCGPoint:location];
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.delegate = self;
    [basicAnimation setValue:[NSValue valueWithCGPoint:location] forKey:@"BasicAnimation"];
    basicAnimation.duration = 5.0;
    [_layer addAnimation:basicAnimation forKey:@"BasicAnimation_position"];
}

- (void)rotationAnimation
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAnimation.toValue = [NSNumber numberWithFloat:M_PI_2 * 3];
    basicAnimation.duration = 6.0;
    basicAnimation.autoreverses = true;
    
    basicAnimation.repeatCount = HUGE_VALF;
    basicAnimation.removedOnCompletion = NO;
    
    [_layer addAnimation:basicAnimation forKey:@"BasicAnimation_rotation"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
    CAAnimation *animation = [_layer animationForKey:@"BasicAnimation_position"];
    if(animation)
    {
        if(_layer.speed == 0)
        {
            [self animationResume];
        }
        else
        {
            [self animationPause];
        }
    }
    else
    {
        [self translationAnimation:location];
        [self rotationAnimation];
    }
    
}


- (void)animationPause
{
    CFTimeInterval interval = [_layer convertTime:CACurrentMediaTime() fromLayer:nil];
    [_layer setTimeOffset:interval];
    _layer.speed = 0;
}

- (void)animationResume
{
    CFTimeInterval beginTime = CACurrentMediaTime() - _layer.timeOffset;
    _layer.timeOffset = 0;
    _layer.beginTime = beginTime;
    _layer.speed = 1.0;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    _layer.position = [[anim valueForKey:@"BasicAnimation"] CGPointValue];
    [CATransaction commit];
    
    [self animationPause];
}

@end
