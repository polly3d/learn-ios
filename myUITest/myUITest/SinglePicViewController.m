//
//  SinglePicViewController.m
//  myUITest
//
//  Created by wang on 15/11/25.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "SinglePicViewController.h"

@interface SinglePicViewController ()

@end

@implementation SinglePicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.scrollView];
    
    UIImage *image = [UIImage imageNamed:@"8.jpg"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:self.imageView];
    
    _scrollView.contentSize = self.imageView.frame.size;
    
    _scrollView.minimumZoomScale = 0.6;
    _scrollView.maximumZoomScale = 3.0;
    _scrollView.delegate = self;
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGSize originasize = self.scrollView.bounds.size;
    CGSize contentSize = self.scrollView.contentSize;
    CGFloat offsetX = originasize.width > contentSize.width ?(originasize.width - contentSize.width)/2:0;
    CGFloat offsetY = originasize.height > contentSize.height?(originasize.height - contentSize.height)/2:0;
    self.imageView.center = CGPointMake(contentSize.width/2+offsetX, contentSize.height/2+offsetY);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
