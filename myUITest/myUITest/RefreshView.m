//
//  RefreshView.m
//  myUITest
//
//  Created by wang on 15/12/2.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "RefreshView.h"

@implementation RefreshView

- (void)drawRect:(CGRect)rect
{
    NSString *str = _title;
    UIFont *font = [UIFont fontWithName:@"Marker Felt" size:_fontSize];
    UIColor *foreignColor = [UIColor redColor];
    [str drawInRect:CGRectMake(100, 120, 300, 200) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:foreignColor}];
}

@end
