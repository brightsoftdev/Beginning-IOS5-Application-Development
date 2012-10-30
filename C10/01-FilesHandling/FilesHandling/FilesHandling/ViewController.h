//
//  ViewController.h
//  FilesHandling
//
//  Created by WYP on 12-10-30.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (NSString *)documentsPath;
- (NSString *)readFromFile:(NSString *)filePath;
- (void)writeToFile:(NSString *)text withFileName:(NSString *)filePath;

@end
