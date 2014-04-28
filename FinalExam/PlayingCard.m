//
//  PlayingCard.m
//  Test1b
//
//  Created by Rachel Johnson on 2/27/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;
@synthesize rank;

-(id)init{
    if(self){
        _suit = @"";
    }
    return self;
}

-(void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

+(NSArray *)validSuits{
    return @[@"♥", @"♣", @"♦", @"♠"];
}

-(NSString *)getSuit{
    if(!self.suit){
        return @"?";
    }
    else{
        return _suit;
    }
}

+(NSArray *)rankStrings{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7",
    @"8", @"9", @"10", @"J", @"Q", @"K"];
}

-(NSString*)content{
    NSArray *rankStrings = [PlayingCard  rankStrings];
    NSString *fullString = [rankStrings objectAtIndex:rank];
    NSString *endString = @"";
    endString = [fullString stringByAppendingString:_suit];
    return endString;
    //return _suit;
}

+(NSUInteger)maxRank{
    return [[self rankStrings] count]-1;
}

-(void)setRank:(NSUInteger)rank2{
    if(rank2 <= [PlayingCard maxRank]){
        rank = rank2;
    }
}

-(NSUInteger)matchHow:(PlayingCard *)otherCard{
    if(self.rank == otherCard.rank){
        return 1;
    //}
    //else if([self.suit isEqualToString:otherCard.suit]){
      //  return 2;
    }
    else{
        return 0;
    }
}

@end
