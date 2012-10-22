//
//  HelloWorldViewController.m
//  EmptyApp
//
//  Created by WYP on 12-10-21.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClicked:(id)sender
{
    if (secondViewController == nil) {
        secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    }
    //[self.view addSubview:secondViewController.view];
    [UIView transitionWithView:self.view
                      duration:1.5
                       options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionAllowAnimatedContent
                    animations:^{
                        [self.view addSubview:secondViewController.view];
                    }
                    completion:NULL];
}

- (void)dealloc
{
    [secondViewController release];
    [super dealloc];
}

@end
