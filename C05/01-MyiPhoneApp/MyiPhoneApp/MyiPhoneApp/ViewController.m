//
//  ViewController.m
//  MyiPhoneApp
//
//  Created by WYP on 12-10-23.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= 30200)
    
    NSString *str;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        str = @"Running as an iPad application";
    } else {
        str = @"Running as an iPhone/iPod touch application";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Platform"
                                                    message:str
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    [alert release];
    
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
