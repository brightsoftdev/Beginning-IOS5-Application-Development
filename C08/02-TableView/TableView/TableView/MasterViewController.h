//
//  MasterViewController.h
//  TableView
//
//  Created by WYP on 12-10-27.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController<UISearchBarDelegate>
{
    NSDictionary *movieTitles;
    NSArray *years;
    IBOutlet UISearchBar *m_searchBar;
    
    BOOL isSearchOn;
    BOOL canSelectRow;
    NSMutableArray *listOfMovies;
    NSMutableArray *searchResult;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (nonatomic, retain) NSDictionary *moviewTitles;
@property (nonatomic, retain) NSArray *years;
@property (nonatomic, retain) UISearchBar *m_searchBar;

- (void)doneSearching:(id)sender;
- (void)searchMoviesTableView;

@end
