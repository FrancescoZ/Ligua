//
//  MenuViewController.m
//  Ligua
//
//  Created by Francesco Zanoli on 30/11/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import "MenuViewController.h"
#import "ProfileTableCell.h"
#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"


enum {
    profileIndex= 0,
    groupsIndex=1,
    eventsIndex=2
};

static const int numOfRows = 3;
static NSString * const menuProfileCellIdentifier = @"menuProfileCellReuseIdentifier";

@interface MenuViewController ()

@end

//The menu will always have three section, profile with status, groups and events
//so we make a list of class who heredi from TableCellViewController
@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//Show row at index
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==profileIndex){
        ProfileTableCell *cell = (ProfileTableCell *)[super tableView:tableView
                            cellForRowAtIndexPath:indexPath];
        cell.usernameLabel.text=@"Username";
        cell.statusLabel.text=@"Status";
        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.size.width / 2;
        cell.profileImageView.clipsToBounds = YES;
        cell.statusImageView.layer.cornerRadius = cell.statusImageView.frame.size.width / 2;
        cell.statusImageView.clipsToBounds = YES;
        //profileCell.profileImageView=user.Image;
        //profileCell.statusImage=user.Status.Image;
        
        return cell;
    }
    else if (indexPath.row==groupsIndex){
       //second
    }
    else if (indexPath.row==eventsIndex){
        
    }
    return [super tableView:tableView
      cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *destinationViewController = nil;
    
    if(indexPath.row == profileIndex) {
        destinationViewController = [[AppDelegate globalDelegate] profileViewController];
    }else{
        [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
        return;
    }
    
    [[[AppDelegate globalDelegate] drawerViewController] setCenterViewController:destinationViewController];
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==profileIndex){
        return 104;
    }
    else if (indexPath.row==groupsIndex){
        //second
    }
    else if (indexPath.row==eventsIndex){
        
    }
    return 0;

}


//Version 2.0
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
