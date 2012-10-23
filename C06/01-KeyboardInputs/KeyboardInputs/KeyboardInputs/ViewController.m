//
//  ViewController.m
//  KeyboardInputs
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
    [textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) doneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction) bgTouched:(id)sender
{
    [textField resignFirstResponder];
}

- (void)dealloc
{
    [textField release];
    [super dealloc];
}

@end
