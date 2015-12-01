//
//  PhotoGestureViewController.m
//  myUITest
//
//  Created by wang on 15/11/30.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "PhotoGestureViewController.h"

@interface PhotoGestureViewController ()
{
    UIImageView *_imgView;
    int _currentIndex;
}
@end

@implementation PhotoGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self addGesture];
}

#pragma mark 初始化ui
- (void)initUI
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat topPadding = 20;
    CGFloat y = 64 + topPadding,height = screenSize.height - y - topPadding;
    
    CGRect imageFrame = CGRectMake(0, y, screenSize.width, height);
    _imgView = [[UIImageView alloc] initWithFrame:imageFrame];
    _imgView.contentMode = UIViewContentModeScaleToFill;
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    UIImage *img = [UIImage imageNamed:@"0.jpg"];
    _imgView.image = img;
    
    [self showPhoneName];
    
}

#pragma mark 添加手势 
- (void)addGesture
{
    //添加点按手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGesture];
    
    //添加长按手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressImage:)];
    longPressGesture.minimumPressDuration = .5;
    [_imgView addGestureRecognizer:longPressGesture];
    
    //添加捏合手势
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchImage:)];
    [self.view addGestureRecognizer:pinchGesture];
    
    //添加旋转手势
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateImage:)];
    [self.view addGestureRecognizer:rotationGesture];
    
    //添加拖动手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panImage:)];
    [_imgView addGestureRecognizer:panGesture];
    
    //添加轻扫手势
    //注意一个轻扫手势仅控制一个方向，默认是向右
    UISwipeGestureRecognizer *swipeGestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeImage:)];
    [self.view addGestureRecognizer:swipeGestureRight];
    
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeImage:)];
    swipeGestureLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGestureLeft];
    
    
    [panGesture requireGestureRecognizerToFail:swipeGestureLeft];
    [panGesture requireGestureRecognizerToFail:swipeGestureRight];
    [longPressGesture requireGestureRecognizerToFail:panGesture];
}

- (void)showPhoneName
{
    NSString *title = [NSString stringWithFormat:@"%i.jpg",_currentIndex];
    [self setTitle:title];
}


#pragma mark - 手势操作
#pragma mark 点按隐藏或显示导航栏
- (void)tapImage:(UITapGestureRecognizer *)gesture
{
    BOOL hidden = !self.navigationController.navigationBarHidden;
    [self.navigationController setNavigationBarHidden:hidden];
}

#pragma mark 长按提示是否删除
- (void)longPressImage:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否删除图片" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionNo = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *actionYes = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:actionNo];
        [alert addAction:actionYes];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

#pragma mark 捏合缩放图片
- (void)pinchImage:(UIPinchGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateChanged)
    {
        _imgView.transform = CGAffineTransformMakeScale(gesture.scale, gesture.scale);
    }
    else
    {
        [UIView animateWithDuration:.5 animations:^{
            _imgView.transform = CGAffineTransformIdentity;
        }];
    }
}

#pragma mark 旋转图片
- (void)rotateImage:(UIRotationGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateChanged)
    {
        _imgView.transform = CGAffineTransformMakeRotation(gesture.rotation);
    }
    else if(gesture.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:.8 animations:^{
            _imgView.transform = CGAffineTransformIdentity;
        }];
    }
}

#pragma mark 拖动图片
- (void)panImage:(UIPanGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [gesture translationInView:self.view];
        _imgView.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
    }
    else if(gesture.state == UIGestureRecognizerStateEnded)
    {
        _imgView.transform = CGAffineTransformIdentity;
    }
}

#pragma mark 轻扫则查看下一张或上一张图片
- (void)swipeImage:(UISwipeGestureRecognizer *)gesture
{
    if(gesture.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        //向右，下一张图片
        [self nextImg];
    }
    else if(gesture.direction == UISwipeGestureRecognizerDirectionRight)
    {
        //向左，上一张图片
        [self preImg];
    }
}


- (void)nextImg
{
    int index = (_currentIndex + 1) % 3;
    NSString *path = [NSString stringWithFormat:@"%i.jpg",index];
    _imgView.image = [UIImage imageNamed:path];
    _currentIndex = index;
    [self showPhoneName];
    
}

- (void)preImg
{
    int index = (_currentIndex + 3 - 1) % 3;
    NSString *path = [NSString stringWithFormat:@"%i.jpg",index];
    _imgView.image = [UIImage imageNamed:path];
    _currentIndex = index;
    [self showPhoneName];
}

@end
