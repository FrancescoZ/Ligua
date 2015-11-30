//
//  AppDelegate.m
//  Ligua
//
//  Created by Francesco Zanoli on 25/11/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"
#import "MenuViewController.h"

static NSString * const DrawersStoryboardName = @"Main";

static NSString * const LeftMenuStoryboardID = @"LeftMenuViewControllerStoryboardID";
static NSString * const RightMenuStoryboardID = @"RightMenuViewControllerStoryboardID";

static NSString * const profileViewControllerStoryboardID = @"profileViewControllerStoryboardID";
static NSString * const eventViewControllerStoryboardID = @"eventViewControllerStoryboardID";

@interface AppDelegate ()

@property (nonatomic, strong, readonly) UIStoryboard *drawersStoryboard;

@end

@implementation AppDelegate

@synthesize drawersStoryboard = _drawersStoryboard;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //Set first viewController
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.drawerViewController;
    [self configureDrawerViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - Application Methods

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Swipe Menu

- (JVFloatingDrawerViewController *)drawerViewController {
    if (!_drawerViewController) {
        _drawerViewController = [[JVFloatingDrawerViewController alloc] init];
    }
    
    return _drawerViewController;
}

#pragma mark Sides

- (MenuViewController *)leftMenuViewController {
    if (!_leftMenuViewController) {
        _leftMenuViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:LeftMenuStoryboardID];
    }
    
    return _leftMenuViewController;
}

- (UITableViewController *)settingViewController {
    if (!_settingViewController) {
        _settingViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:RightMenuStoryboardID];
    }
    
    return _settingViewController;
}

#pragma mark Center

- (UIViewController *)profileViewController {
    if (!_profileViewController) {
        _profileViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:profileViewControllerStoryboardID];
    }
    
    return _profileViewController;
}

- (UIViewController *)eventViewController {
    if (!_eventViewController) {
        _eventViewController = [self.drawersStoryboard instantiateViewControllerWithIdentifier:eventViewControllerStoryboardID];
    }
    
    return _eventViewController;
}

- (JVFloatingDrawerSpringAnimator *)drawerAnimator {
    if (!_drawerAnimator) {
        _drawerAnimator = [[JVFloatingDrawerSpringAnimator alloc] init];
    }
    
    return _drawerAnimator;
}

- (UIStoryboard *)drawersStoryboard {
    if(!_drawersStoryboard) {
        _drawersStoryboard = [UIStoryboard storyboardWithName:DrawersStoryboardName bundle:nil];
    }
    
    return _drawersStoryboard;
}

- (void)configureDrawerViewController {
    self.drawerViewController.leftViewController = (UITableViewController *)self.leftMenuViewController;
    self.drawerViewController.rightViewController = self.settingViewController;
    self.drawerViewController.centerViewController = self.profileViewController;
    
    self.drawerViewController.animator = self.drawerAnimator;
    
    self.drawerViewController.backgroundImage = [UIImage imageNamed:@"sky"];
}

#pragma mark - Global Access Helper

+ (AppDelegate *)globalDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated {
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideLeft animated:animated completion:nil];
}

- (void)toggleRightDrawer:(id)sender animated:(BOOL)animated {
    [self.drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideRight animated:animated completion:nil];
}

@end
