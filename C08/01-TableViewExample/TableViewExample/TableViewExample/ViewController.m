//
//  ViewController.m
//  TableViewExample
//
//  Created by WYP on 12-10-27.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSMutableArray *listOfMovies;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    listOfMovies = [[NSMutableArray alloc] init ];
    [listOfMovies addObject:@"A"];
    [listOfMovies addObject:@"B"];
    [listOfMovies addObject:@"C"];
    [listOfMovies addObject:@"D"];
    [listOfMovies addObject:@"E"];
    [listOfMovies addObject:@"F"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [listOfMovies release];
    [super dealloc];
}


#pragma mark -
#pragma mark Table view datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listOfMovies count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Movie List";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"by wyp";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    }
    
    NSString *cellValue = [listOfMovies objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    UIImage *image = [UIImage imageNamed:@"apple.jpeg"];
    cell.imageView.image = image;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [indexPath row] % 2;
}

#pragma mark -
#pragma mark Table view delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *movieSelected = [listOfMovies objectAtIndex:indexPath.row];
    NSString *msg = [NSString stringWithFormat:@"You have selected %@", movieSelected];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Movie selected"
                                                    message:msg
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


@end
