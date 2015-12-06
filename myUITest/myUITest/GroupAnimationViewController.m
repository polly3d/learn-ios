//
//  GroupAnimationViewController.m
//  myUITest
//
//  Created by wang on 15/12/4.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "GroupAnimationViewController.h"

@interface GroupAnimationViewController ()
{
    CALayer *_layer;
}
@end

@implementation GroupAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"background.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    _layer = [[CALayer alloc] init];
    _layer.bounds = CGRectMake(0, 0, 10, 20);
    _layer.position = CGPointMake(50, 150);
    _layer.contents = (id)[UIImage imageNamed:@"petal.png"].CGImage;
    [self.view.layer addSublayer:_layer];
    
    [self groupAnimation];
}

- (void)groupAnimation
{
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    
    CABasicAnimation *basicAnimation = [self rotationAnimation];
    CAKeyframeAnimation *keyFrameAnimation = [self translationAnimation];
    animationGroup.animations = @[basicAnimation,keyFrameAnimation];
    
    animationGroup.delegate = self;
    animationGroup.duration = 10;
    animationGroup.beginTime = CACurrentMediaTime() + 2;
    
    [_layer addAnimation:animationGroup forKey:nil];
}

- (CABasicAnimation *)rotationAnimation
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
   
    CGFloat toValue = M_PI_2 * 3;
    basicAnimation.toValue = [NSNumber numberWithFloat:M_PI_2 * 3];
    basicAnimation.autoreverses = true;
    basicAnimation.repeatCount = HUGE_VALF;
    basicAnimation.removedOnCompletion = NO;
    
    [basicAnimation setValue:[NSNumber numberWithFloat:toValue] forKey:@"RotationProperty_tovalue"];
    return basicAnimation;
}

- (CAKeyframeAnimation *)translationAnimation
{
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, _layer.position.x, _layer.position.y);
    CGPathAddCurveToPoint(path, nil, 160, 280, -30, 300, 55, 400);
    keyFrameAnimation.path = path;
    CGPathRelease(path);
    
    [keyFrameAnimation setValue:[NSValue valueWithCGPoint:CGPointMake(55, 400)] forKey:@"TranslationProperty_tovalue"];
    return keyFrameAnimation;
    
}

#pragma mark - 代理方法
#pragma mark 动画完成
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    CAAnimationGroup *animationGroup=(CAAnimationGroup *)anim;
    CABasicAnimation *basicAnimation=animationGroup.animations[0];
    CAKeyframeAnimation *keyframeAnimation=animationGroup.animations[1];
    CGFloat toValue=[[basicAnimation valueForKey:@"RotationProperty_tovalue"] floatValue];
    CGPoint endPoint=[[keyframeAnimation valueForKey:@"TranslationProperty_tovalue"] CGPointValue];
    
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    //设置动画最终状态
    _layer.position=endPoint;
    _layer.transform=CATransform3DMakeRotation(toValue, 0, 0, 1);
    
    [CATransaction commit];
}


@end
