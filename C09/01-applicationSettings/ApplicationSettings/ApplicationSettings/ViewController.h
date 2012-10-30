//
//  ViewController.h
//  ApplicationSettings
//
//  Created by WYP on 12-10-30.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UITextField *loginName;
    IBOutlet UITextField *password;
    IBOutlet UIPickerView *favoriteColor;
}

@property (nonatomic, retain) UITextField *loginName;
@property (nonatomic, retain) UITextField *password;
@property (nonatomic, retain) UIPickerView *favoriteColor;

- (IBAction)loadSettings:(id)sender;
- (IBAction)saveSettings:(id)sender;
- (IBAction)doneEditing:(id)sender;

@end
