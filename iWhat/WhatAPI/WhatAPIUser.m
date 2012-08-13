//
//  WhatAPIUser.m
//  iWhat
//
//  Created by James Rollenhagen on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WhatAPIUser.h"
#import <Restkit/Restkit.h>

@implementation WhatAPIUser

@synthesize username;
@synthesize avatar;
@synthesize userclass;

+ (WhatAPIUser *)initUserWithUserID:(int)userID {
    WhatAPIUser *user = [[WhatAPIUser alloc] init];
    [user loadUserWithUserID:userID];
    return user;
}

- (void)loadUserWithUserID:(int)userID {
    RKObjectManager* manager = [RKObjectManager objectManagerWithBaseURLString:@"https://ssl.what.cd"];
    
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[WhatAPIUser class]];
    [objectMapping mapKeyPath:@"username" toAttribute:@"username"];
    [objectMapping mapKeyPath:@"avatar" toAttribute:@"avatar"];
    [objectMapping mapKeyPath:@"personal.class" toAttribute:@"userclass"];
    [manager.mappingProvider setObjectMapping:objectMapping forKeyPath:@"response"];
    
    NSString *path = [NSString stringWithFormat:@"/ajax.php?action=user&id=%d", userID];
    
    [manager loadObjectsAtResourcePath:path delegate:self];
}

// RKObjectLoaderDelegate methods

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects {
    WhatAPIUser *user = [objects objectAtIndex:0];
    NSLog(@"Loaded User %@", user.username);
    NSLog(@"Has avatar at %@", user.avatar);
    NSLog(@"Has class of %@", user.userclass);
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Encountered an error: %@", error);
}

@end



