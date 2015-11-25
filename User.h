//
//  User.h
//  Ligua
//
//  Created by Francesco Zanoli on 25/11/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import <Foundation/Foundation.h>

//contain data user and it's linked with the Db
@interface User : NSObject

//Unique identifier
@property (strong, nonnull) NSString* ID;
//username used to log in
@property (strong, nonnull) NSString* Name;
//encoded password in MD5 to log in
@property (strong, nonnull) NSString* Password;

//List of group of friends, relation ** on db
@property (strong, nonnull) NSMutableArray* Groups;
//List of group of event, relation ** on db.
//Every user can participate to an event without a group
@property (strong, nonnull) NSMutableArray* Events;

@end
