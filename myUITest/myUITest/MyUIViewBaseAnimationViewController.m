//
//  MyUIViewBaseAnimationViewController.m
//  myUITest
//
//  Created by wang on 15/12/5.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MyUIViewBaseAnimationViewController.h"

@interface MyUIViewBaseAnimationViewController ()
{
    UIImageView *_imageView;
}
@end

@implementation MyUIViewBaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"background.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"petal.png"]];
    _imageView.center = CGPointMake(50, 150);
    [self.view addSubview:_imageView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    //方法1：block方式
    [UIView animateWithDuration:5.0 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _imageView.center = location;
    }completion:^(BOOL finished){
        NSLog(@"animation end.");
    }];
    
    //方法2：静态方法
//    [UIView beginAnimations:@"MyBasicAnimation" context:nil];
//    [UIView setAnimationDuration:5.0];
//    _imageView.center = location;
//    [UIView commitAnimations];
}



@end
