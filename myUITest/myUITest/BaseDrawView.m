//
//  BaseDrawView.m
//  myUITest
//
//  Created by wang on 15/12/1.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "BaseDrawView.h"

@implementation BaseDrawView

- (void)drawRect:(CGRect)rect
{
    //[self drawLine];
    [self drawLineSimple];
    [self drawRectByDefault];
    [self drawRectByUIKit];
    [self drawArc];
    [self drawCurve];
    [self drawText];
    //[self drawImage];
}

#pragma mark 画线
- (void)drawLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 50);
    CGPathAddLineToPoint(path, nil, 20, 100);
    CGPathAddLineToPoint(path, nil, 300, 100);
    
    CGContextAddPath(context, path);
    
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);
    CGContextSetRGBFillColor(context, 0, 1.0, 0, 1);
    
    CGContextSetLineWidth(context, 2.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    //绘制虚线
    CGFloat lengths[2] = {8,8};
    CGContextSetLineDash(context, 0, lengths, 2);
    
    //设置阴影
    CGColorRef color = [UIColor grayColor].CGColor;
    CGContextSetShadowWithColor(context, CGSizeMake(12, 2), 0.8, color);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGPathRelease(path);
}

#pragma mark 简单画线
- (void)drawLineSimple
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 20, 50);
    CGContextAddLineToPoint(context, 20, 100);
    CGContextAddLineToPoint(context, 300, 100);
    CGContextClosePath(context);
    
    [[UIColor redColor] setStroke];
    [[UIColor blueColor] setFill];
    
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制矩形
- (void)drawRectByDefault
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, CGRectMake(20, 50, 280, 50));
    [UIColor blueColor];
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制矩形（利用UIKit的封闭方法)
- (void)drawRectByUIKit
{
    //CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect1 = CGRectMake(20, 150, 280, 50);
    CGRect rect2 = CGRectMake(20, 250, 280, 50);
    
    [[UIColor yellowColor] set];
    UIRectFill(rect1);
    
    [[UIColor redColor] setStroke];
    UIRectFrame(rect2);
}

#pragma mark 绘制椭圆
- (void)drawEllipse
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(50, 50, 220, 200);
    CGContextAddEllipseInRect(context, rect);
    [[UIColor purpleColor] set];
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制弧形
- (void)drawArc
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, 160, 160, 100, 0, M_PI_2, 1);
    [[UIColor yellowColor] set];
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark 绘制曲线
- (void)drawCurve
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 20, 100);
    
    CGContextAddQuadCurveToPoint(context, 160, 0, 300, 100);
    
    
    CGContextMoveToPoint(context, 20, 500);
    CGContextAddCurveToPoint(context, 80, 300, 240, 500, 300, 300);
    
    [[UIColor yellowColor] set];
    [[UIColor redColor] setStroke];
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
}

#pragma mark 绘制文字
- (void)drawText
{
    NSString *str = @"";
    CGRect rect = CGRectMake(20, 50, 280, 300);
    UIFont *font = [UIFont systemFontOfSize:18];
    UIColor *color = [UIColor redColor];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    NSTextAlignment align = NSTextAlignmentLeft;
    style.alignment = align;
    [str drawInRect:rect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color,NSParagraphStyleAttributeName:style}];
    
}

#pragma mark 图像绘制
- (void)drawImage
{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    [image drawAtPoint:CGPointMake(10, 50)];
    //绘制到指定的矩形中，注意如果大小不合适会拉伸
//    [image drawInRect:CGRectMake(10, 50, 300, 450)];
    //平铺绘制
//    [image drawAsPatternInRect:CGRectMake(0, 0, 320, 568)];
}


@end
