//
//  RatingControl.m
//  FoodTracker
//
//  Created by wang on 15/10/20.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "RatingControl.h"

@implementation RatingControl

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (int)stars
{
    return 5;
}

- (NSMutableArray *)ratingButtons
{
    if(!_ratingButtons)
    {
        _ratingButtons = [[NSMutableArray alloc] init];
    }
    return _ratingButtons;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        for (int i = 0; i < self.stars; i++)
        {
            UIButton *btn = [[UIButton alloc] init];
            btn.frame = CGRectMake(0, 0, 44, 44);
            [btn setImage:[UIImage imageNamed:@"emptyStar"] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"filledStar"] forState:UIControlStateSelected];
            [btn setImage:[UIImage imageNamed:@"filledStar"] forState:UIControlStateHighlighted];
            [btn addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchDown];
            [self.ratingButtons addObject: btn];
            [self addSubview:btn];
        }
    }
    return self;
    
}

- (void)layoutSubviews
{
    int buttonSize = self.frame.size.height;
    CGRect rect = CGRectMake(0, 0, buttonSize, buttonSize);
    for (int i = 0; i < 5; i++) {
        UIButton *button = [self.ratingButtons objectAtIndex:i];
        CGFloat num = i * (buttonSize + 5);
        rect.origin.x = num;
        button.frame = rect;
    }
}

- (void)ratingButtonTapped:(UIButton *)button
{
    self.rating = [self.ratingButtons indexOfObject:button] + 1;
    [self updateButtonSelectionStates];
}

- (void)updateButtonSelectionStates
{
    for (int i = 0; i < self.stars; i++) {
        UIButton *button = [self.ratingButtons objectAtIndex:i];
        button.selected = i < self.rating;
    }
}

- (CGSize)intrinsicContentSize
{
    int buttonSize = self.frame.size.height;
    int width = (buttonSize + 5) * self.stars;
    return CGSizeMake(width, buttonSize);
}

@end
