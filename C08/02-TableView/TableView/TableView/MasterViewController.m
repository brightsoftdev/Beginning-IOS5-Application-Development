//
//  MasterViewController.m
//  TableView
//
//  Created by WYP on 12-10-27.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

@synthesize m_searchBar;

@synthesize moviewTitles;
@synthesize years;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}
							
- (void)dealloc
{
    [_detailViewController release];
    [_objects release];
    
    [listOfMovies release];
    [searchResult release];
    
    [moviewTitles release];
    [years release];
    [m_searchBar release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)] autorelease];
    self.navigationItem.rightBarButtonItem = addButton;
     */
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Movies"
                                                     ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    self.moviewTitles = dic;
    [dic release];
    
    NSArray *array = [[self.moviewTitles allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    self.years = array;
    
    self.tableView.tableHeaderView = m_searchBar;
    self.m_searchBar.autocorrectionType = UITextAutocorrectionTypeYes;
    
    listOfMovies = [[NSMutableArray alloc] init ];
    for (NSString *year in array) {
        NSArray *movies = [moviewTitles objectForKey:year];
        for (NSString *title in movies) {
            [listOfMovies addObject:title];
        }
    }
    
    searchResult = [[NSMutableArray alloc] init ];
    isSearchOn = NO;
    canSelectRow = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (isSearchOn) {
        return 1;
    } else {
        return [self.years count];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isSearchOn) {
        return [searchResult count];
    } else {
        NSString *year = [self.years objectAtIndex:section];
        
        NSArray *movieSection = [self.moviewTitles objectForKey:year];
        
        return [movieSection count];
    }
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    if (isSearchOn) {
        NSString *cellValue = [searchResult objectAtIndex:indexPath.row];
        cell.textLabel.text = cellValue;
    } else {
        
        NSString *year = [self.years objectAtIndex:indexPath.section];
        
        NSArray *movieSection = [self.moviewTitles objectForKey:year];
        
        cell.textLabel.text = [movieSection objectAtIndex:indexPath.row];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *year = [self.years objectAtIndex:section];
    if (isSearchOn) {
        return nil;
    } else {
        return year;
    }
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    //eturn self.years;
    if (isSearchOn == YES) {
        return nil;
    } else {
        return self.years;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *message;
    if (!isSearchOn) {
        NSString *year = [self.years objectAtIndex:[indexPath section]];
        NSArray *movieSection  = [self.moviewTitles objectForKey:year];
        NSString *movieTitle = [movieSection objectAtIndex:[indexPath row]];
        message = [NSString stringWithFormat:@"You have selected %@", movieTitle];
    } else {
        if ([searchResult count] == 0) {
            return;
        }
        message = [NSString stringWithFormat:@"You have selected %@", [searchResult objectAtIndex:indexPath.row]];
    }
    
    if (!self.detailViewController) {
        self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil] autorelease];
    }
    
    self.detailViewController.detailItem = message;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
    
    /*
    NSDate *object = _objects[indexPath.row];
    self.detailViewController.detailItem = object;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
     */
}

#pragma mark -
#pragma mark search

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    isSearchOn = YES;
    if (searchBar.text.length > 0) {
        canSelectRow = YES;
        self.tableView.scrollEnabled = YES;
    } else {
        canSelectRow = NO;
        self.tableView.scrollEnabled = NO;
    }
    
    self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self
                                                  action:@selector(doneSearching:)]
                                                autorelease];
}

- (void)doneSearching:(id)sender
{
    isSearchOn = NO;
    canSelectRow = YES;
    self.tableView.scrollEnabled = YES;
    self.navigationItem.rightBarButtonItem = nil;
    
    [m_searchBar resignFirstResponder];
    
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText length] > 0) {
        canSelectRow = YES;
        self.tableView.scrollEnabled = NO;
        [self searchMoviesTableView];
    } else {
        canSelectRow = NO;
        self.tableView.scrollEnabled = NO;
    }
    [self.tableView reloadData];
}

- (void)searchMoviesTableView
{
    [searchResult removeAllObjects];
    
    for (NSString *str in listOfMovies) {
        NSRange titleResultsRange = [str rangeOfString:m_searchBar.text
                                               options:NSCaseInsensitiveSearch];
        if (titleResultsRange.length > 0) {
            [searchResult addObject:str];
        }
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self searchMoviesTableView];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (canSelectRow) {
        return indexPath;
    } else {
        return nil;
    }
}

@end













