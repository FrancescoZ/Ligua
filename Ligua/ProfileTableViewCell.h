//
//  ProfileTableCell.h
//  Ligua
//
//  Created by Francesco Zanoli on 30/11/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UIImageView *profileImageView;
@property (nonatomic, weak) IBOutlet UIImageView *statusImageView;

@end
