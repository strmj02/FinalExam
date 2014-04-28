//
//  CardMatchingGame.m
//  Test1b(revision)
//
//  Created by Rachel Johnson on 2/27/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCard.h"

@implementation CardMatchingGame
@synthesize score;

-(id)initWithCardCount:(NSUInteger)count usingdeck:(Deck *)deck{
    cards = [[NSMutableArray alloc]init];
    for(int i = 0; i < count; i++){
        Card *card = [deck drawRandomCard];
        PlayingCard *pcard = (PlayingCard *)card;
        [deck removeCard:pcard];
        [cards addObject:pcard];
    }
    return self;
}

-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *c = [cards objectAtIndex:index];
    c.chosen = YES;
    [cards replaceObjectAtIndex:index withObject:c];
}

-(Card *)cardAt:(NSUInteger)index{
    return [cards objectAtIndex:index];
}

@end
