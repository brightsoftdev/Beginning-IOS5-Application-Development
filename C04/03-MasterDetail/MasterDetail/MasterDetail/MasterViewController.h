//
//  MasterViewController.h
//  MasterDetail
//
//  Created by WYP on 12-10-22.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController
{
    NSMutableArray *listOfMovies;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
