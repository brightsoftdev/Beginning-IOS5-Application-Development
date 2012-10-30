//
//  ViewController.m
//  FilesHandling
//
//  Created by WYP on 12-10-30.
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
    NSString *fileName =  [[self documentsPath] stringByAppendingPathComponent:@"data.txt"];
    [self writeToFile:@"a string of text" withFileName:fileName];
    NSString *fileContent = [self readFromFile:fileName];
    NSLog(@"%@", fileContent);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)documentsPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return documentsDir;
}

- (void)writeToFile:(NSString *)text withFileName:(NSString *)filePath
{
    NSMutableArray *array = [[NSMutableArray alloc] init ];
    [array addObject:text];
    [array writeToFile:filePath atomically:YES];
    [array release];
}

- (NSString *)readFromFile:(NSString *)filePath
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
        NSString *data = [NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
        [array release];
        return data;
    } else {
        return nil;
    }
}

@end










