//
//  ViewController.h
//  KeyboardInputs
//
//  Created by WYP on 12-10-23.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextField *textField;
}

- (IBAction) doneEditing:(id)sender;
- (IBAction) bgTouched:(id)sender;

@end
