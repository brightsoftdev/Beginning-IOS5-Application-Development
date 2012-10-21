//
//  ViewController.m
//  UsingViews
//
//  Created by WYP on 12-10-21.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize pageControl;
@synthesize imageView1, imageView2;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [imageView1 setImage:[UIImage imageNamed:@"iMac_old.jpeg"]];
    tempImageView = imageView2;
    
    [imageView1 setHidden:NO];
    [imageView2 setHidden:YES];
    
    [pageControl addTarget:self
                    action:@selector(pageTurning:)
          forControlEvents:UIControlEventValueChanged];
    
    prevPage = 0;
}

- (void) pageTurning: (UIPageControl *) pageController
{
    NSLog(@"page turning.");
    NSInteger nextPage = [pageController currentPage];
    switch (nextPage) {
        case 0:
            [tempImageView setImage:
             [UIImage imageNamed:@"iMac_old.jpeg"]];
            break;
        case 1:
            [tempImageView setImage:
             [UIImage imageNamed:@"iMac.jpeg"]];
            break;
        case 2:
            [tempImageView setImage:
             [UIImage imageNamed:@"Mac8100.jpeg"]];
            break;
        case 3:
            [tempImageView setImage:
             [UIImage imageNamed:@"MacPlus.jpeg"]];
            break;
        case 4:
            [tempImageView setImage:
             [UIImage imageNamed:@"MacSE.jpeg"]];
            break;
        default:
            break;
    }
    if (tempImageView.tag == 0) {
        tempImageView = imageView2;
        bgImageView = imageView1;
    } else {
        tempImageView = imageView1;
        bgImageView = imageView2;
    }
    
    UIViewAnimationOptions transitionOption;
        
    if (nextPage > prevPage) {
        transitionOption = UIViewAnimationOptionTransitionFlipFromLeft;
    } else {
        transitionOption = UIViewAnimationOptionTransitionFlipFromRight;
    }
    
    [UIView transitionWithView:tempImageView
                      duration:2.5
                       options:transitionOption
                    animations:^{
                        [tempImageView setHidden:YES];
                    }
                    completion:NULL];
    
    [UIView transitionWithView:bgImageView
                      duration:2.5
                       options:transitionOption
                    animations:^{
                        [bgImageView setHidden:NO];
                    }
                    completion:NULL];
    
    prevPage = nextPage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
