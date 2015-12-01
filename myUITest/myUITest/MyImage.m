//
//  MyImage.m
//  myUITest
//
//  Created by wang on 15/11/30.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "MyImage.h"

@interface MyImage()
{
    UILabel *_label;
}

@end

@implementation MyImage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        UIImage *img = [UIImage imageNamed:@"3.jpg"];
        self.image = img;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        _label.textColor = [UIColor redColor];
        [self addSubview:_label];
        [self showTipLable:@"准备就绪"];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showTipLable:@"开始移动"];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showTipLable:@"正在移动"];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showTipLable:@"结束移动"];
}

- (void)showTipLable:(NSString *)tip
{
    _label.text = [NSString stringWithFormat:@"imgview %@",tip];
}

@end
