//
//  DrawWithLayerViewController.m
//  myUITest
//
//  Created by wang on 15/12/3.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "DrawWithLayerViewController.h"

@interface DrawWithLayerViewController ()

@end

@implementation DrawWithLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //阴影图层
    CALayer *layerShadow = [[CALayer alloc] init];
    layerShadow.bounds = CGRectMake(0, 0, 150, 150);
    layerShadow.position = CGPointMake(160, 200);
    layerShadow.cornerRadius = 150 / 2;
    layerShadow.shadowColor = [UIColor grayColor].CGColor;
    layerShadow.shadowOffset = CGSizeMake(2, 1);
    layerShadow.shadowOpacity = 1;
    layerShadow.borderColor = [UIColor whiteColor].CGColor;
    layerShadow.borderWidth = 2;
    [self.view.layer addSublayer:layerShadow];
    
    CALayer *layer= [[CALayer alloc] init];
    layer.bounds = CGRectMake(0, 0, 150, 150);
    layer.position = CGPointMake(160, 200);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.cornerRadius = 150 / 2;
    
    layer.masksToBounds = YES;
    
    layer.borderColor = [UIColor whiteColor].CGColor;
    layer.borderWidth = 2;
    
    layer.delegate = self;
    
    UIImage *image = [UIImage imageNamed:@"4.jpg"];
    [layer setContents:(id)image.CGImage];
    
    [self.view.layer addSublayer:layer];
    
    //[layer setNeedsDisplay];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSaveGState(ctx);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -150);
    UIImage *image = [UIImage imageNamed:@"4.jpg"];
    CGContextDrawImage(ctx, CGRectMake(0, 0, 150, 150), image.CGImage);
    CGContextRestoreGState(ctx);
}


@end
