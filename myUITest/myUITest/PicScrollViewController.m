//
//  PicScrollViewController.m
//  myUITest
//
//  Created by wang on 15/11/24.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "PicScrollViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IMG_COUNT 3


@interface PicScrollViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIImageView *_leftImg;
    UIImageView *_centerImg;
    UIImageView *_rightImg;
    UILabel *_label;
    UIPageControl *_pageControl;
    
    NSMutableDictionary *_imgData;
    
    int _totalImg;
    int _currentImangeIndex;
}
@end

@implementation PicScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //解决vc里面第一个scrollview偏移64个点的问题
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadData];
    [self addScrollView];
    [self addImgView];
    [self addPageControl];
    [self addLabel];
    [self setDefaultImg];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 自定义方法
- (void)loadData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"imageInfo" ofType:@"plist"];
    _imgData = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    _totalImg = (int)_imgData.count;
}

- (void)addScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(IMG_COUNT * SCREEN_WIDTH, 0);
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
}

- (void)addImgView
{
    _leftImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _leftImg.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_leftImg];
    
    _centerImg = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _centerImg.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_centerImg];
    
    _rightImg = [[UIImageView alloc] initWithFrame:CGRectMake(2 * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _rightImg.contentMode = UIViewContentModeScaleAspectFit;
    [_scrollView addSubview:_rightImg];
}

- (void)addPageControl
{
    _pageControl = [[UIPageControl alloc] init];
    CGSize size = [_pageControl sizeForNumberOfPages:_totalImg];
    _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
    _pageControl.numberOfPages = _totalImg;
    _pageControl.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT - 100);
    _pageControl.pageIndicatorTintColor=[UIColor colorWithRed:193/255.0 green:219/255.0 blue:249/255.0 alpha:1];
    _pageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    [self.view addSubview:_pageControl];
}

- (void)addLabel
{
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, 30)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor=[UIColor colorWithRed:0 green:150/255.0 blue:1 alpha:1];
    [self.view addSubview:_label];
}


- (void)setDefaultImg
{
    _leftImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",_totalImg - 1]];
    _centerImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",0]];
    _rightImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",1]];
    
    _currentImangeIndex = 0;
    
    _pageControl.currentPage = _currentImangeIndex;
    
    NSString *imgName = [NSString stringWithFormat:@"%i.jpg",_currentImangeIndex];
    _label.text = _imgData[imgName];
}

- (void)reloadImg
{
    int lefImgIndex,rightImgIndex;
    CGPoint offset = [_scrollView contentOffset];
    if(offset.x > SCREEN_WIDTH)
    {
        _currentImangeIndex = (_currentImangeIndex + 1) % _totalImg;
    }
    else if(offset.x < SCREEN_WIDTH)
    {
        _currentImangeIndex = (_currentImangeIndex + _totalImg - 1) % _totalImg;
    }
    
    lefImgIndex = (_currentImangeIndex + _totalImg - 1) % _totalImg;
    rightImgIndex = (_currentImangeIndex + 1) % _totalImg;
    
    _leftImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",lefImgIndex]];
    _centerImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",_currentImangeIndex]];
    _rightImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",rightImgIndex]];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self reloadImg];
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    _pageControl.currentPage = _currentImangeIndex;
    NSString *imageName = [NSString stringWithFormat:@"%i.jpg",_currentImangeIndex];
    _label.text = _imgData[imageName];
}

@end
