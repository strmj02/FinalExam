//
//  EtchViewController.h
//  FinalExam
//
//  Created by Rachel Johnson on 4/26/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawView.h"

@interface EtchViewController : UIViewController<UIGestureRecognizerDelegate>

@property (nonatomic) float lastVelocity;


@property (weak, nonatomic) IBOutlet DrawView *drawView;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@property (nonatomic) UIRotationGestureRecognizer *rightGesture;
@property (nonatomic) UIRotationGestureRecognizer *leftGesture;


-(IBAction)addHorizontal:(id)sender;
-(IBAction)handleLineAdditions:(id)sender;
-(IBAction)addVertical:(id)sender;
@end
