//
//  ViewController.h
//  OutletsAndAction
//
//  Created by WYP on 12-10-21.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextField *txtName;
}

@property (nonatomic, retain) UITextField *txtName;

- (IBAction)btnClicked:(id)sender;

@end
