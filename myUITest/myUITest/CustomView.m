//
//  CustomView.m
//  myUITest
//
//  Created by wang on 15/12/3.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "CustomView.h"
#import "MyLayer.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"initWithFrame");
    if(self = [super initWithFrame:frame])
    {
        MyLayer *layer = [[MyLayer alloc] init];
        layer.bounds = CGRectMake(0, 0, 185, 185);
        layer.position = CGPointMake(160, 284);
        layer.backgroundColor = [UIColor blueColor].CGColor;
        [layer setNeedsDisplay];
        [self.layer addSublayer:layer];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"2-drawRect");
    [super drawRect:rect];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    NSLog(@"1-drawLayer:inContext:");
    [super drawLayer:layer inContext:ctx];
}

@end
