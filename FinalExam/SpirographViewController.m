//
//  SpirographViewController.m
//  MoravianSpirograph
//
//  Created by Michael Toth on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "SpirographViewController.h"
#import "HarmonigraphView.h"
#import "SpirographView.h"

@interface SpirographViewController ()

@end

@implementation SpirographViewController

@synthesize stepSize;
@synthesize numberOfSteps;
@synthesize lslider;
@synthesize kslider;
@synthesize scrollView;


-(id)init{
    self = [super init];
    if(self){
        
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect harmoView = CGRectMake(0,20, 280, 280);
    HarmonigraphView *view = [[HarmonigraphView alloc]initWithFrame:harmoView];
    [scrollView addSubview:view];
    
    
    CGRect spiroView = CGRectMake(280, 20, 280, 280);
    SpirographView *view2 = [[SpirographView alloc]initWithFrame:spiroView];
    [view2 setL:[lslider value]];
    [view2 setK:[kslider value]];
    [view2 setNumberOfSteps:[self.numberOfSteps.text intValue]];
    [view2 setStepSize:[self.stepSize.text floatValue]];
    
    [scrollView addSubview:view2];
    [scrollView setPagingEnabled:YES];
    
    numberOfSteps.delegate = self;
    stepSize.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAppeared:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWentAway:) name:UIKeyboardWillHideNotification object:nil];

}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    CGSize size = CGSizeMake(560, 280);
    [scrollView setContentSize:size];
    [scrollView setPagingEnabled:YES];

}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setLslider:nil];
    [self setKslider:nil];
    [self setNumberOfSteps:nil];
    [self setStepSize:nil];
    [self setNumberOfSteps:nil];
    [self setStepSize:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)redraw:(id)sender {
    
    [[scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGRect harmoView = CGRectMake(0,20, 280, 280);
    HarmonigraphView *view = [[HarmonigraphView alloc]initWithFrame:harmoView];
    [scrollView addSubview:view];
    
    CGRect spiroView = CGRectMake(280, 20, 280, 280);
    SpirographView *view2 = [[SpirographView alloc]initWithFrame:spiroView];
    [scrollView addSubview:view2];
    [view2 setL:[lslider value]];
    [view2 setK:[kslider value]];
    [view2 setNumberOfSteps:[self.numberOfSteps.text intValue]];
    [view2 setStepSize:[self.stepSize.text floatValue]];

    [self.view setNeedsDisplay];
}

-(void)keyboardAppeared:(NSNotification *)note{
    CGSize keyboardSize = [[[note userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey]CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y -=keyboardSize.height;
    self.view.frame = newFrame;
}

-(void)keyboardWentAway:(NSNotification *)note{
    CGSize keyboardSize = [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y +=keyboardSize.height;
    self.view.frame = newFrame;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
