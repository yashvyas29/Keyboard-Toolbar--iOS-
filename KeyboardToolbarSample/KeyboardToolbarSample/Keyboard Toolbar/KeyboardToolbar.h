//
//  KeyboardToolbar.h
//  MoodTracker
//
//  Created by Chandra Prakash on 13/09/13.
//  Copyright (c) 2013 Chandra prakash. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KeyboardToolbarDelegate <NSObject>

- (void)doneButtonPressed;
- (void)prevButtonPressed;
- (void)nextButtonPressed;

@end

@interface KeyboardToolbar : UIToolbar

@property (nonatomic, retain) IBOutlet UISegmentedControl *sPrevNext;
@property (nonatomic, retain) id<KeyboardToolbarDelegate> delegate;

- (IBAction)hideKeyboard:(id)sender;
- (IBAction)moveToPrevInputField;
- (IBAction)moveToNextInputField;

@end
