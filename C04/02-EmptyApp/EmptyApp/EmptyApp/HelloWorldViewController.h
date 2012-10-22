//
//  HelloWorldViewController.h
//  EmptyApp
//
//  Created by WYP on 12-10-21.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface HelloWorldViewController : UIViewController
{
    SecondViewController *secondViewController;
}

- (IBAction)btnClicked:(id)sender;

@end
