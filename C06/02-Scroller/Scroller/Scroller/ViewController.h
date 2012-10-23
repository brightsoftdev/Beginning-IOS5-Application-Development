//
//  ViewController.h
//  Scroller
//
//  Created by WYP on 12-10-23.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIScrollView *scrollView;
    
    UITextField *currentTextField;
    BOOL keyboardIsShown;
}

@property (nonatomic, retain) UIScrollView *scrollView;

@end
