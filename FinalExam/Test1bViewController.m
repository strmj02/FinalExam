//
//  Test1bViewController.m
//  Test1b
//
//  Created by Rachel Johnson on 2/27/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "Test1bViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
//#import "morback.png"

@interface Test1bViewController ()

@end

@implementation Test1bViewController
@synthesize scoreLabel;
@synthesize buttons;
@synthesize game;
@synthesize score;

-(id)init{
    self = [super init];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        UIImage *i = [UIImage imageNamed:@"cardtabbaritem2.png"];
        [tbi setImage:i];
        // Custom initialization
    }
    return self;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    PlayingCardDeck *deck = [[PlayingCardDeck alloc]init];
    game = [[CardMatchingGame alloc]initWithCardCount:16 usingdeck:deck];
    score = 0;
}

- (void)viewDidUnload
{
    [self setButtons:nil];
    [self setScoreLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonPressed:(id)sender {
    //get tag of the sender
    int index = [sender tag];
    
    //get card at the index (which is tag -1) and cast to playingCard
    Card *card = [game cardAt:(index -1)];
    PlayingCard *pcard = (PlayingCard *)card;
    
    int cardsChosen = 0;
    for(int i = 0; i < 16; i++){
        Card *c = [game cardAt:i];
        if(c.chosen){
            cardsChosen++;
        }
    }
    
    if(pcard.matched){
        //nothing. you cannot play with a matched card
    }
    else if(!pcard.chosen && cardsChosen < 2){ //and less than two cards are chosen
        //decrement score
        score--;
        NSString *str = [@"Score: " stringByAppendingFormat:@"%d", score];
        [scoreLabel setText:str];
        //[game setScore:([game getScore]-1)];
        //flip card over
        [(UIButton *)sender setImage:nil forState:UIControlStateNormal];
        [(UIButton *)sender setTitle:pcard.content forState:UIControlStateNormal];
        [(UIButton *)sender setBackgroundColor:[UIColor whiteColor]];
        PlayingCard *otherCard = nil;
        //is there another chosen card, if so which one?
        
        int placeholder = -1;
        for(int i = 0; i < 16; i++){
            Card *c = [game cardAt:i];
            PlayingCard *p = (PlayingCard *)c;
            if(i!=index-1 && p.chosen){
                otherCard = p;
                placeholder = i;
            }
        }
        pcard.chosen = YES;
        //DO THE CARDS MATCH? IF SO HOW?
        if(otherCard != nil){
            //int match = [pcard matchHow:otherCard];
            if(otherCard.rank == pcard.rank){
                //this is a rank match
                pcard.chosen = NO;
                pcard.matched = YES;
                otherCard.chosen = NO;
                otherCard.matched = YES;
                score +=16;
                NSString *str = [@"Score: " stringByAppendingFormat:@"%d", score];
                [scoreLabel setText:str];
                [(UIButton *)sender setBackgroundColor:[UIColor blackColor]];
                [(UIButton *)[buttons objectAtIndex:placeholder +1] setBackgroundColor:[UIColor blackColor]];
                
                }
            else if([[otherCard getSuit] isEqualToString:[pcard getSuit]]){
                //this is a suit match
                pcard.chosen = NO;
                pcard.matched = YES;
                otherCard.chosen = NO;
                otherCard.matched = YES;
                score +=4;
                NSString *str = [@"Score: " stringByAppendingFormat:@"%d", score];
                [scoreLabel setText:str];
                [(UIButton *)sender setBackgroundColor:[UIColor blackColor]];
                [(UIButton *)[buttons objectAtIndex:placeholder +1] setBackgroundColor:[UIColor blackColor]];
                
            }
            else{
                score -=2;
                NSString *str = [@"Score: " stringByAppendingFormat:@"%d", score];
                [scoreLabel setText:str];
            }
        }
    }
    else if(pcard.chosen){
        //flip card to back
        UIImage *btnImage = [UIImage imageNamed:@"morback.png"];
        [(UIButton *)sender setImage:btnImage forState:UIControlStateNormal];
        pcard.chosen = NO;
        [(UIButton *)sender setTitle:nil forState:UIControlStateNormal];
    }
}


@end
