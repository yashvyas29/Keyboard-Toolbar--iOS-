//
//  KeyboardToolbar.m
//  MoodTracker
//
//  Created by Chandra Prakash on 13/09/13.
//  Copyright (c) 2013 Chandra prakash. All rights reserved.
//

#import "KeyboardToolbar.h"

@implementation KeyboardToolbar

@synthesize sPrevNext = _sPrevNext;
@synthesize delegate = _delegateKT;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle] loadNibNamed:@"KeyboardToolbar" owner:self options:nil] lastObject];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)moveToPrevInputField {
    [_delegateKT prevButtonPressed];
}

- (IBAction)moveToNextInputField {
    [_delegateKT nextButtonPressed];
}

- (IBAction)hideKeyboard:(id)sender {
    [_delegateKT doneButtonPressed];
}

@end
