//
//  EventTableViewCell.h
//  Ligua
//
//  Created by Francesco Zanoli on 01/12/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *nComponentsLabel;

@end
