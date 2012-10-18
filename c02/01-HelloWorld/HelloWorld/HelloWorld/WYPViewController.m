//
//  WYPViewController.m
//  HelloWorld
//
//  Created by WYP on 12-10-18.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import "WYPViewController.h"

@interface WYPViewController ()

@end

@implementation WYPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) btnClicked:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello World!"
                                                    message:@"iPhone, here I come!"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    [alert release];
}

@end
