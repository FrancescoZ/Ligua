//
//  AppDelegate.h
//  Ligua
//
//  Created by Francesco Zanoli on 25/11/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuViewController;
@class JVFloatingDrawerViewController;
@class JVFloatingDrawerSpringAnimator;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//left swipe menu controller
@property (nonatomic, strong) JVFloatingDrawerViewController *drawerViewController;
//left swipe menu animation
@property (nonatomic, strong) JVFloatingDrawerSpringAnimator *drawerAnimator;

//meni and setting ViewController, it's use to know which one is selected, left will never change
@property (nonatomic, strong) UITableViewController *leftMenuViewController;
@property (nonatomic, strong) UITableViewController *settingViewController;

//ViewController for the different part of the app
@property (nonatomic, strong) UIViewController *groupViewController;
@property (nonatomic, strong) UIViewController *groupSettingViewController;

@property (nonatomic, strong) UIViewController *eventViewController;
@property (nonatomic, strong) UIViewController *eventSettingViewController;

@property (nonatomic, strong) UIViewController *profileViewController;
@property (nonatomic, strong) UIViewController *profileSettingViewController;

//to edit proprieties from every part of the code
+ (AppDelegate *)globalDelegate;

//open and close action
- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated;
- (void)toggleRightDrawer:(id)sender animated:(BOOL)animated;

@end

