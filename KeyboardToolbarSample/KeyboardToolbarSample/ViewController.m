//
//  ViewController.m
//  KeyboardToolbarSample
//
//  Created by Chandra Prakash on 21/09/13.
//  Copyright (c) 2013 YashFiles. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    KeyboardToolbar* keyboardToolbar;
    CGPoint scrollViewPoint;
    UIView* vwActive;
}

@property (nonatomic, retain) NSMutableArray* mArrInputs;
@property (nonatomic, retain) NSMutableDictionary* mDictTextViewPHs;

@end

@implementation ViewController

- (void)viewDidLoad
{
    _sVwDetail.contentSize = CGSizeMake(320, 700);
    scrollViewPoint = _sVwDetail.contentOffset;
    
    keyboardToolbar = [[KeyboardToolbar alloc] init];
    keyboardToolbar.delegate = self;
    
    _txtFullName.inputAccessoryView = keyboardToolbar;
    _txtEmail.inputAccessoryView = keyboardToolbar;
    _txtEmail.inputAccessoryView = keyboardToolbar;
    _txtAddress1.inputAccessoryView = keyboardToolbar;
    _txtAddress2.inputAccessoryView = keyboardToolbar;
    _txtCity.inputAccessoryView = keyboardToolbar;
    _txtState.inputAccessoryView = keyboardToolbar;
    _txtPinCode.inputAccessoryView = keyboardToolbar;
    _txtCountry.inputAccessoryView = keyboardToolbar;
    
    _mDictTextViewPHs = [[NSMutableDictionary alloc] initWithCapacity:2];
    [_mDictTextViewPHs setValue:_txtAddress1.text forKey:@"ADDRESS1"];
    [_mDictTextViewPHs setValue:_txtAddress2.text forKey:@"ADDRESS2"];
    
    _mArrInputs = [[NSMutableArray alloc] initWithCapacity:8];
    [_mArrInputs addObject:_txtFullName];
    [_mArrInputs addObject:_txtEmail];
    [_mArrInputs addObject:_txtAddress1];
    [_mArrInputs addObject:_txtAddress2];
    [_mArrInputs addObject:_txtCity];
    [_mArrInputs addObject:_txtState];
    [_mArrInputs addObject:_txtPinCode];
    [_mArrInputs addObject:_txtCountry];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Memory management

- (void)dealloc {
    [self setMArrInputs:nil];
    [self setMDictTextViewPHs:nil];
    [self setTxtFullName:nil];
    [self setTxtEmail:nil];
    [self setTxtAddress1:nil];
    [self setTxtAddress2:nil];
    [self setTxtCity:nil];
    [self setTxtState:nil];
    [self setTxtPinCode:nil];
    [self setTxtCountry:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)saveButtonPressed:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    if (_txtFullName.text.length == 0) {
        alert.title = @"Please enter full name !!!";
    } else if (_txtEmail.text.length == 0) {
        alert.title = @"Please enter email !!!";
    } else if (_txtAddress1.text.length == 0) {
        alert.title = @"Please enter address1 !!!";
    } else if (_txtCity.text.length == 0) {
        alert.title = @"Please enter city !!!";
    } else if (_txtState.text.length == 0) {
        alert.title = @"Please enter state !!!";
    } else if (_txtPinCode.text.length == 0) {
        alert.title = @"Please enter pin code !!!";
    } else if (_txtCountry.text.length == 0) {
        alert.title = @"Please enter country !!!";
    } else {
        alert.title = @"Information Saved Successfully !!!";
    }
    
    [alert show];
}

#pragma mark - Text field delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    vwActive = textField;
    vwActive.tag = textField.tag;
    
    CGRect rect = textField.bounds;
    rect = [textField convertRect:rect toView:_sVwDetail];
    CGPoint point = rect.origin;
    point.x = 0;
    point.y -= 16;
    
    [UIView animateWithDuration:0.8 animations:^{
        [_sVwDetail setContentOffset:point];
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [UIView animateWithDuration:0.8 animations:^{
        [_sVwDetail setContentOffset:scrollViewPoint];
    }];
    return YES;
}

#pragma mark - Text view delegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    vwActive = textView;
    vwActive.tag = textView.tag;
    
    if (textView == _txtAddress1 && [_txtAddress1.text isEqualToString:[_mDictTextViewPHs valueForKey:@"ADDRESS1"]]) {
        _txtAddress1.text = @"";
        _txtAddress1.textColor = [UIColor blackColor];
    } else if (textView == _txtAddress2 && [_txtAddress2.text isEqualToString:[_mDictTextViewPHs valueForKey:@"ADDRESS2"]]) {
        _txtAddress2.text = @"";
        _txtAddress2.textColor = [UIColor blackColor];
    }
    
    CGRect rect = textView.bounds;
    rect = [textView convertRect:rect toView:_sVwDetail];
    CGPoint point = rect.origin;
    point.x = 0;
    point.y -= 16;
    
    [UIView animateWithDuration:0.8 animations:^{
        [_sVwDetail setContentOffset:point];
    }];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView == _txtAddress1 && _txtAddress1.text.length == 0) {
        _txtAddress1.text = [_mDictTextViewPHs valueForKey:@"ADDRESS1"];
        _txtAddress1.textColor = [UIColor lightGrayColor];
    } else if (textView == _txtAddress2 && _txtAddress2.text.length == 0) {
        _txtAddress2.text = [_mDictTextViewPHs valueForKey:@"ADDRESS2"];
        _txtAddress2.textColor = [UIColor lightGrayColor];
    }
}

#pragma mark - Keyboard toolbar delegate

- (void)doneButtonPressed {
    [vwActive resignFirstResponder];
    [UIView animateWithDuration:0.8 animations:^{
        [_sVwDetail setContentOffset:scrollViewPoint];
    }];
}

- (void)prevButtonPressed {
    NSInteger iPrevIndex = vwActive.tag - 2;
    if (iPrevIndex >= 0) {
        [[_mArrInputs objectAtIndex:iPrevIndex] becomeFirstResponder];
    }
}

- (void)nextButtonPressed {
    NSInteger iNextIndex = vwActive.tag;
    if (iNextIndex < _mArrInputs.count) {
        [[_mArrInputs objectAtIndex:iNextIndex] becomeFirstResponder];
    }
}

@end
