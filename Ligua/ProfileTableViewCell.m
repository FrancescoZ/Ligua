//
//  ProfileTableCell.m
//  Ligua
//
//  Created by Francesco Zanoli on 30/11/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import "ProfileTableViewCell.h"

@implementation ProfileTableViewCell

@synthesize usernameLabel = _usernameLabel;
@synthesize statusLabel = _statusLabel;
@synthesize profileImageView = _profileImageView;
@synthesize statusImageView = _statussImageView;

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
