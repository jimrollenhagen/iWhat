//
//  WhatAPIUser.h
//  iWhat
//
//  Created by James Rollenhagen on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Restkit/Restkit.h>

@interface WhatAPIUser : NSObject <RKObjectLoaderDelegate>

@property (nonatomic, retain) NSString* username;
@property (nonatomic, retain) NSString* avatar;
@property (nonatomic, retain) NSString* userclass;

+ (WhatAPIUser *)initUserWithUserID:(int)userID;
- (void)loadUserWithUserID;

@end
