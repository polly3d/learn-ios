//
//  Card.m
//  CardGame
//
//  Created by wang on 15/9/9.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards)
    {
        if([card.content isEqualToString:self.content])
        {
            score = 1;
        }
    }
    return score;
}

@end
