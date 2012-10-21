//
//  ViewController.m
//  OutletsAndAction
//
//  Created by WYP on 12-10-21.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize txtName;

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

- (IBAction)btnClicked:(id)sender
{
    NSString *str = [[NSString alloc] initWithFormat:@"Hello, %@", txtName.text];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello"
                                                    message:str
                                                   delegate:self
                                          cancelButtonTitle:@"Done"
                                          otherButtonTitles: nil];
    [alert show];
    [str release];
    [alert release];
}

- (void)dealloc
{
    [txtName release];
    [super dealloc];
}

@end
