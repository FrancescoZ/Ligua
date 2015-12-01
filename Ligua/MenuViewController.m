//
//  MenuViewController.m
//  Ligua
//
//  Created by Francesco Zanoli on 30/11/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import "MenuViewController.h"
#import "ProfileTableViewCell.h"
#import "GroupTableViewCell.h"
#import "EventTableViewCell.h"
#import "AppDelegate.h"
#import "JVFloatingDrawerViewController.h"


enum {
    profileIndex= 0,
    groupsIndex=1,
    eventsIndex=2
};

static NSString * const menuGroupCellIdentifier = @"menuGroupCellReuseIdentifier";
static NSString * const menuEventCellIdentifier = @"menuEventCellReuseIdentifier";
static NSString * const menuProfileCellIdentifier = @"menuProfileCellReuseIdentifier";

@interface MenuViewController ()

@end

//The menu will always have three section, profile with status, groups and events
//so we make a list of class who heredi from TableCellViewController
@implementation MenuViewController

@synthesize Groups;
@synthesize Events;

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    Groups=[[NSMutableArray alloc] init];
    Events=[[NSMutableArray alloc] init];
    for (int i=0; i<3; i++) {
        
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:i inSection:groupsIndex];
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [Groups addObject:[NSString stringWithFormat:@"Group %i", i]];
        [self.tableView endUpdates];
    }
    for (int i=0; i<4; i++) {
        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:i inSection:eventsIndex];
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [Events addObject:[NSString stringWithFormat:@"Event %i", i]];
        [self.tableView endUpdates];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height = 0;
    if (section == profileIndex) {
        // static section
        height = [super tableView:tableView heightForHeaderInSection:section];
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    CGFloat height = 0;
    if (section == profileIndex) {
        // static section
        height = [super tableView:tableView heightForFooterInSection:section];
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 25;
    if (indexPath.section == profileIndex) {
        // static section
        height = [super tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger indentationLevel = 2;
    if (indexPath.section == profileIndex) {
        // static section
        indentationLevel = [super tableView:tableView indentationLevelForRowAtIndexPath:indexPath];
    }
    return indentationLevel;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case profileIndex:
            return 1;
            break;
        case groupsIndex:
            return [Groups count];
            break;
        case eventsIndex:
            return [Events count];
            break;
        default:
            return 0;
            break;
    }
}

//Show row at index
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case profileIndex:{
            ProfileTableViewCell *cell = (ProfileTableViewCell *)[super tableView:tableView                                                            cellForRowAtIndexPath:indexPath];
            cell.usernameLabel.text=@"Username";
            cell.statusLabel.text=@"Status";
            cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.size.width / 2;
            cell.profileImageView.clipsToBounds = YES;
            cell.statusImageView.layer.cornerRadius = cell.statusImageView.frame.size.width / 2;
            cell.statusImageView.clipsToBounds = YES;
            //profileCell.profileImageView=user.Image;
            //profileCell.statusImage=user.Status.Image;
            
            return cell;}
            break;
        case groupsIndex:{
            GroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:menuGroupCellIdentifier];
            if (!cell)
            {
                // create a cell
                cell = [[GroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuGroupCellIdentifier];
                cell.textLabel.textColor=[UIColor grayColor];
                [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:11]];           cell.nameLabel=cell.textLabel;
            }
            cell.nameLabel.text = Groups[indexPath.row];
            return cell;
            break;
        }
        case eventsIndex:{
            EventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:menuEventCellIdentifier];
            if (!cell)
            {
                // create a cell
                cell = [[EventTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuGroupCellIdentifier];
                cell.textLabel.textColor=[UIColor grayColor];
                [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica Neue" size:11]];           cell.nameLabel=cell.textLabel;
            }
            cell.nameLabel.text = Events[indexPath.row];
            return cell;
            break;
        }

        default:
            return [super tableView:tableView cellForRowAtIndexPath:indexPath];
            break;
    }
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *destinationViewController = nil;
    
    if(indexPath.section == profileIndex) {
        destinationViewController = [[AppDelegate globalDelegate] profileViewController];
    }else if (indexPath.section==eventsIndex){
        destinationViewController = [[AppDelegate globalDelegate] eventViewController];
    }else {
        [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
        return;
    }
    
    [[[AppDelegate globalDelegate] drawerViewController] setCenterViewController:destinationViewController];
    [[AppDelegate globalDelegate] toggleLeftDrawer:self animated:YES];
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
