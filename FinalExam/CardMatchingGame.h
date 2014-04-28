//
//  CardMatchingGame.h
//  Test1b(revision)
//
//  Created by Rachel Johnson on 2/27/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject{
    NSInteger score;
    NSMutableArray *cards;
}

@property (readonly) NSInteger score;

-(id)initWithCardCount:(NSUInteger)count usingdeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;

-(Card *)cardAt:(NSUInteger)index;

@end
