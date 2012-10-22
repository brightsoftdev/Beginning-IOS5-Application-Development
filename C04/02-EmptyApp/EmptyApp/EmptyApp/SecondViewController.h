//
//  SecondViewController.h
//  EmptyApp
//
//  Created by WYP on 12-10-22.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    UILabel *label;
    UIButton *button;
}

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UIButton *button;

- (IBAction)buttonClicked: (id) sender;

@end
