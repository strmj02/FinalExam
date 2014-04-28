//
//  SpiroView.m
//  FinalExam
//
//  Created by Rachel Johnson on 4/26/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import "SpiroView.h"

@implementation SpiroView

@synthesize k;
@synthesize l;
@synthesize stepSize;
@synthesize numberOfSteps;
@synthesize overWrite;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor yellowColor]];
        overWrite = YES;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bz = [[UIBezierPath alloc] init];
    [self setNeedsDisplay];
    CGFloat t=0.0;
    if (!lastK) {
        lastK = 0.45;
    }
    if (!lastL) {
        lastL = 0.54;
    }

    //[bz moveToPoint:[self sCurve:t l:lastL k:lastK]];
    //for (t=0; t<self.numberOfSteps*self.stepSize; t=t+self.stepSize) {
    //    [bz addLineToPoint:[self sCurve:t l:lastL k:lastK]];
        
    //}
    t=0;
    [bz moveToPoint:[self sCurve:t l:self.l k:self.k]];
    for (t=0; t<self.numberOfSteps*self.stepSize; t=t+self.stepSize) {
        [bz addLineToPoint:[self sCurve:t l:self.l k:self.k]];
    }
    [bz stroke];
    
    lastL = self.l;
    lastK = self.k;
    
    
    //[[NSString stringWithFormat:@"l = %.2f, k = %.2f",self.l, self.k] drawAtPoint:CGPointMake(20, 260) withAttributes:nil];
    
}

/*
 UIGraphicsBeginImageContext(rect.size);
 CGContextRef context = UIGraphicsGetCurrentContext();
 [self.view.layer renderInContext:context];
 UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 return img;
 */

- (CGPoint) sCurve:(CGFloat)t l:(CGFloat)l k:(CGFloat)k {
    
    return CGPointMake(140+120*((1-self.k)*cos(t)+self.l*self.k*cos(((1-self.k)/self.k)*t)), 140+120*((1-self.k)*sin(t)-self.l*self.k*sin(((1-self.k)/self.k)*t)));
}


@end
