//
//  PlayingCard.h
//  temp
//
//  Created by wang on 15/11/3.
//  Copyright © 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;

@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuid;

@end
