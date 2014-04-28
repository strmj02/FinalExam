//
//  Card.m
//  Test1b
//
//  Created by Rachel Johnson on 2/27/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize contents;
@synthesize chosen;
@synthesize matched;

-(id)init{
    if(self){
        contents = [[NSString alloc]init];
        chosen = NO;
        matched = NO;
    }
    return self;
}

-(NSString *)returnContentsWithRank:(NSString *)rank andSuit: (NSString *)suit{
    contents = [rank stringByAppendingString:suit];
    return contents;
}

-(int)match:(Card*)card{
    if([card.contents isEqualToString: self.contents]){
        return 1;
    }
    else{
        return 0;
    }
};

@end
