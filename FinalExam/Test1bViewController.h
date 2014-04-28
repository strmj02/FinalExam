//
//  Test1bViewController.h
//  Test1b
//
//  Created by Rachel Johnson on 2/27/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface Test1bViewController : UIViewController

- (IBAction)buttonPressed:(id)sender;

@property (nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic) int score;

@end
