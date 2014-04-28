//
//  Deck.m
//  Test1b
//
//  Created by Rachel Johnson on 2/27/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "Deck.h"

@implementation Deck

-(id)init{
    self = [super init];
    if (self) {
        self.cards = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addCard:(Card*)aCard:(BOOL) atTop{
    if(atTop){
        [self.cards insertObject:aCard atIndex:0];
    }
    else{
        [self.cards addObject:aCard];
    }
    
}
-(void)addCard:(Card*)aCard{
    [self.cards addObject:aCard];
}

//-(NSMutableArray *)cards{
//    if(!self.cards){
//        self.cards = [[NSMutableArray alloc]init];
//    }
//    return self.cards;
//}

-(Card *)drawRandomCard{
    Card *randomCard = nil;
    if([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = [self.cards objectAtIndex:index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

-(void)removeCard:(Card *)card{
    [self.cards removeObject:card];
}


-(void)dealloc{
    self.cards = nil;
}
@end
