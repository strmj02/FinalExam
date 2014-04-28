//
//  PlayingCardDeck.m
//  Test1b(revision)
//
//  Created by Rachel Johnson on 2/27/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init {
    self = [super init];
    if (self) {
         for (NSString *suit in [PlayingCard validSuits]) {
             for (NSUInteger i =1; i<13 ; i++) {
                 PlayingCard *card = [[PlayingCard alloc] init];
                 card.rank = i;
                 [card setSuit:suit];
                 [self addCard:card];
             }
        }
    }
    return self;
}


@end
