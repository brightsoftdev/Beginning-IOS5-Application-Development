//
//  AppDelegate.h
//  TabbedApp
//
//  Created by WYP on 12-10-23.
//  Copyright (c) 2012年 WYP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
