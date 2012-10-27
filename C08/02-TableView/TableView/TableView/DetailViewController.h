//
//  DetailViewController.h
//  TableView
//
//  Created by WYP on 12-10-27.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
