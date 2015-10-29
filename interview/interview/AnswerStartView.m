//
//  AnswerStartView.m
//  interview
//
//  Created by wang on 15/10/28.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "AnswerStartView.h"

@implementation AnswerStartView

- (void)initWith:(int)star
{
    self.star = star;
    for (int i = 0; i <= star; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake((44 * i) + 5, 0, 44, 44);
        [btn setImage:[UIImage imageNamed:@"filledStar"] forState:UIControlStateNormal];
        //[btn setImage:[UIImage imageNamed:@"filledStar"] forState:UIControlStateSelected];
        //[btn setImage:[UIImage imageNamed:@"filledStar"] forState:UIControlStateHighlighted];
        //[btn addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
    }
}

+ (id)initWith:(int)star
{
    AnswerStartView *view = [[AnswerStartView alloc] init];
    [view initWith:star];
    return view;
}


@end
