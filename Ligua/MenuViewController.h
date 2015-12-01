//
//  MenuViewController.h
//  Ligua
//
//  Created by Francesco Zanoli on 30/11/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong,atomic) NSMutableArray *Groups;
@property (strong,atomic) NSMutableArray *Events;
//@property (strong,atomic) User *Groups;

@end
