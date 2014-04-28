//
//  SpiroView.h
//  FinalExam
//
//  Created by Rachel Johnson on 4/26/14.
//  Copyright (c) 2014 Rachel Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpiroView : UIView{
    CGFloat lastK, lastL;
  
}

@property (nonatomic) CGFloat l;
@property (nonatomic) CGFloat k;
@property (nonatomic) CGFloat stepSize;
@property (nonatomic) NSUInteger numberOfSteps;
@property (nonatomic) BOOL overWrite;

@end
