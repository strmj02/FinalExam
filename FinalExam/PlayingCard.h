//
//  PlayingCard.h
//  Test1b
//
//  Created by Rachel Johnson on 2/27/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

-(void)setSuit:(NSString *)suit;
+(NSArray*)validSuits;
-(NSString *)getSuit;
+(NSArray *)rankStrings;
-(NSString*)content;
+(NSUInteger)maxRank;
-(NSUInteger)matchHow:(PlayingCard *)otherCard;

@end
