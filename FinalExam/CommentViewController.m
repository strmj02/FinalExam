//
//  CommentViewController.m
//  FinalExam
//
//  Created by Rachel Johnson on 4/26/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (id)init
{
    self = [super init];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        UIImage *i = [UIImage imageNamed:@"second.png"];
        [tbi setImage:i];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
