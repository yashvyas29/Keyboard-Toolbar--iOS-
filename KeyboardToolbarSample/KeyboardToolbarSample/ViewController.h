//
//  ViewController.h
//  KeyboardToolbarSample
//
//  Created by Chandra Prakash on 21/09/13.
//  Copyright (c) 2013 YashFiles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KeyboardToolbar.h"

@interface ViewController : UIViewController
<UITextFieldDelegate,
UITextViewDelegate,
KeyboardToolbarDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView* sVwDetail;
@property (weak, nonatomic) IBOutlet UITextField *txtFullName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextView *txtAddress1;
@property (weak, nonatomic) IBOutlet UITextView *txtAddress2;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtState;
@property (weak, nonatomic) IBOutlet UITextField *txtPinCode;
@property (weak, nonatomic) IBOutlet UITextField *txtCountry;

@end
