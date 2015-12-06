//
//  ShakeViewController.m
//  myUITest
//
//  Created by wang on 15/11/30.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "ShakeViewController.h"

@interface ShakeViewController ()
{
    UIImageView *_img;
    UILabel *_label;
}

@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}

- (void)initUI
{
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(30, 80, 100, 100)];
    [self.view addSubview:_img];
    NSString *path = [self getImgPath];
    _img.image = [UIImage imageNamed:path];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 200, 30)];
    [self.view addSubview:_label];
    [self showName:path];
}

- (void)showName:(NSString *)name
{
    _label.text = [NSString stringWithFormat:@"%@",name];
}

- (NSString *)getImgPath
{
    int randomNum = arc4random() % 4;
    NSString *path = [NSString stringWithFormat:@"%i.jpg",randomNum];
    return path;
}

#pragma mark - 运动方法
#pragma mark 开始运动
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    //仅处理摇晃事件
    if(motion == UIEventSubtypeMotionShake)
    {
        NSString *path = [self getImgPath];
        _img.image = [UIImage imageNamed:path];
        [self showName:path];
    }
}

#pragma mark 结束运动
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
}


@end
