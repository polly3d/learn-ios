//
//  DrawToImageViewController.m
//  myUITest
//
//  Created by wang on 15/12/2.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "DrawToImageViewController.h"

@interface DrawToImageViewController ()

@end

@implementation DrawToImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *img = [self drawImageAtImageContext];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    imageView.center = CGPointMake(160, 284);
    
    [self.view addSubview:imageView];
}

- (UIImage *)drawImageAtImageContext
{
    CGSize size = CGSizeMake(300, 188);
    UIGraphicsBeginImageContext(size);
    
    UIImage *image = [UIImage imageNamed:@"3.jpg"];
    [image drawInRect:CGRectMake(0, 0, 300, 180)];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 200, 178);
    CGContextAddLineToPoint(context, 270, 178);
    
    [[UIColor redColor] setStroke];
    CGContextSetLineWidth(context, 2);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    NSString *str = @"wang";
    [str drawInRect:CGRectMake(200, 158, 100, 30) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Marker Felt" size:15],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
                                                                   
                                                                   
}

@end
