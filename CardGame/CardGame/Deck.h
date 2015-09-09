//
//  Deck.h
//  CardGame
//
//  Created by wang on 15/9/9.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
