//
//  PlayingCard.h
//  CardGame
//
//  Created by wang on 15/9/9.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
