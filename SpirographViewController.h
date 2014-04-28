//
//  SpirographViewController.h
//  MoravianSpirograph
//
//  Created by Michael Toth on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpirographViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)redraw:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *lslider;
@property (weak, nonatomic) IBOutlet UITextField *numberOfSteps;
@property (weak, nonatomic) IBOutlet UISlider *kslider;
@property (weak, nonatomic) IBOutlet UITextField *stepSize;


@end
