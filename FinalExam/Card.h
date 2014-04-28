//
//  Card.h
//  Test1b
//
//  Created by Rachel Johnson on 2/27/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic) BOOL matched;
@property (nonatomic) BOOL chosen;

-(int)match:(Card*)card;
-(NSString *)returnContentsWithRank:(NSString *)rank andSuit: (NSString *)suit;

@end
