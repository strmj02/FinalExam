//
//  EtchViewController.m
//  FinalExam
//
//  Created by Rachel Johnson on 4/26/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "EtchViewController.h"

@interface EtchViewController ()

@end

@implementation EtchViewController

@synthesize lastVelocity;
@synthesize leftView;
@synthesize rightView;
@synthesize drawView;
@synthesize rightGesture, leftGesture;

-(id)init{
    self = [super init];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        UIImage *i = [UIImage imageNamed:@"etchtabbaritem2.png"];
        [tbi setImage:i];
        // Custom initialization
    }
    return self;

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    rightGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleLineAdditions:)];
    leftGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleLineAdditions:)];
    
    [leftGesture setDelegate:self];
    [rightGesture setDelegate:self];
    [self.view addGestureRecognizer:leftGesture];
    [self.view addGestureRecognizer:rightGesture];
    CGAffineTransform landscapeTransform = CGAffineTransformMakeRotation( 1.570796327 ); // 90 degrees in radian
    [self.view setTransform:landscapeTransform];
}

- (void)viewDidUnload
{
    
    [self setDrawView:nil];
    [self setLeftView:nil];
    [self setRightView:nil];
    [self setLeftView:nil];
    [self setRightView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}


- (IBAction)handleLineAdditions:(id)sender{
    CGPoint point = [sender locationOfTouch:0 inView:self.view];
    if(point.x < self.view.bounds.size.width/2){
        [self addHorizontal:sender];
    }
    else{
        [self addVertical:sender];
    }
}

-(IBAction)addHorizontal:(id)sender{;
    UIRotationGestureRecognizer *s = sender;
    if(lastVelocity > 0 && s.velocity < 0){
        [self.drawView saveCurrentPoint];
    }
    if(lastVelocity < 0 && s.velocity > 0){
        [self.drawView saveCurrentPoint];
    }
    [self.drawView setCurrentHorizontalAngle:s.rotation];
    [self.drawView setCurrentVelocity:s.velocity];
    if(s.state ==UIGestureRecognizerStateEnded){
        [self.drawView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}

-(IBAction)addVertical:(id)sender{
    UIRotationGestureRecognizer *s = sender;
    if(lastVelocity > 0 && s.velocity < 0){
        [self.drawView saveCurrentPoint];
    }
    if(lastVelocity < 0 && s.velocity > 0){
        [self.drawView saveCurrentPoint];
    }
    [self.drawView setCurrentVerticalAngle:s.rotation];
    [self.drawView setCurrentVelocity:s.velocity];
    if(s.state ==UIGestureRecognizerStateEnded){
        [self.drawView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}



- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        NSLog(@"HERE");
        [drawView clearBoard];
    }
}
- (BOOL) canBecomeFirstResponder {
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    //make it respond to shake events
    [self becomeFirstResponder];
}


@end
