//
//  EventViewController.m
//  Ligua
//
//  Created by Francesco Zanoli on 29/11/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import "EventViewController.h"
#import "AppDelegate.h"

@interface EventViewController ()

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)actionToggleLeftMenu:(id)sender {
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}

@end
