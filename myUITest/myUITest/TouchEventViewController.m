//
//  TouchEventViewController.m
//  myUITest
//
//  Created by wang on 15/11/30.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "TouchEventViewController.h"
#import "MyImage.h"

@interface TouchEventViewController ()
{
    MyImage *_img;
    UILabel *_label;
}
@end

@implementation TouchEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _img = [[MyImage alloc] initWithFrame:CGRectMake(50, 120, 150, 150)];
    _img.userInteractionEnabled = YES;
    [self.view addSubview:_img];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 30)];
    [self.view addSubview:_label];
    [self showTipText:@""];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showTipText:@"UIViewController 开始触摸事件"];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //取得一个触摸对象
    UITouch *touch = [touches anyObject];
    
    CGPoint current = [touch locationInView:self.view];
    CGPoint previous = [touch previousLocationInView:self.view];
    CGPoint center = _img.center;
    CGPoint offset = CGPointMake(current.x - previous.x, current.y - previous.y);
    _img.center = CGPointMake(center.x + offset.x , center.y + offset.y);
    [self showTipText:@"UIViewController 正在移动"];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showTipText:@"UIViewController 结束触摸"];
}

- (void)showTipText:(NSString *)tip
{
    _label.text = [NSString stringWithFormat:@"提示：%@",tip];
}




@end
