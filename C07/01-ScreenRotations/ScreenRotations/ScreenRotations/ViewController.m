//
//  ViewController.m
//  ScreenRotations
//
//  Created by WYP on 12-10-24.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btn;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self positionViews];
}

- (void)dealloc
{
    [btn release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

- (void)positionViews
{
    UIInterfaceOrientation destOrientation = self.interfaceOrientation;
    if (destOrientation == UIInterfaceOrientationPortrait ||
        destOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        //btn.frame = CGRectMake(20, 20, 233, 37);
        btn.frame = CGRectMake(227, 243, 233, 37);
    } else {
        //btn.frame = CGRectMake(227, 243, 233, 37);
        btn.frame = CGRectMake(20, 20, 233, 37);
    }
}
/*
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
     [self positionViews];
}
*/
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self positionViews];
}


@end
