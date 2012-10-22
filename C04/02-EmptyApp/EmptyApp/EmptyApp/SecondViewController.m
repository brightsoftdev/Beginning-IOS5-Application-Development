//
//  SecondViewController.m
//  EmptyApp
//
//  Created by WYP on 12-10-22.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize label, button;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGRect frame = CGRectMake(20, 10, 280, 50);
    
    label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Verdana" size:20];
    label.text = @"This is a label";
    label.backgroundColor = [UIColor lightGrayColor];
    
    frame = CGRectMake(20, 60, 280, 50);
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"OK" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    
    [button addTarget:self
               action:@selector(buttonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview: label];
    [self.view addSubview: button];
}

- (IBAction) buttonClicked:(id)sender
{
    /*
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Action invoked!"
                                                    message:@"Button clicked!"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    [alert release];
     */
    //[self.view removeFromSuperview];
    [UIView transitionWithView:self.view.superview
                      duration:1.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft | UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionAllowAnimatedContent
                    animations:^{
                        [self.view removeFromSuperview];
                    }
                    completion:NULL];
}

- (void)dealloc
{
    [label release];
    [button release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
