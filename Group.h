//
//  Group.h
//  Ligua
//
//  Created by Francesco Zanoli on 25/11/15.
//  Copyright © 2015 Francesco Zanoli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

//unique identifier
@property (strong, nonnull) NSString* ID;
//name of group of friends
@property (strong, nonnull) NSString* Name;
//list of components, relation ** on the db
@property (strong, nonnull) NSMutableArray* Componets;
//list of event proposed to the group, only a group can be invited to an event but each componet can decide to not partecipate to the event
@property (strong, nonnull) NSMutableArray* ProposedEvent;

@end
