//
//  PlayingCard.m
//  temp
//
//  Created by wang on 15/11/3.
//  Copyright © 2015年 wang. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    NSArray *rankArr = [PlayingCard rankString];
    return [rankArr[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; //Becase we provide setter and getter

- (void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuid] containsObject:suit])
    {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}




+ (NSArray *)rankString
{
    return @[@"?",@"A",@"2",@"3"];
}

+ (NSArray *)validSuid
{
    return @[@"1",@"2",@"3",@"4"];
}

@end
