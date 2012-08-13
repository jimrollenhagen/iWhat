//
//  WhatAPI.m
//  iWhat
//
//  Created by James Rollenhagen on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WhatAPI.h"
#import <RestKit/RestKit.h>

@interface WhatAPI()

@property (nonatomic, strong) RKClient *client;
@end

@implementation WhatAPI

@synthesize client = _client;

- (RKClient *)client {
    return [RKClient sharedClient];
}

- (void)loginUser {
    // make initial get request
    RKRequest *req = [self.client requestWithResourcePath:@"/login.php"];
    RKResponse *res = [req sendSynchronously];
    
    // make login request
    req = [self.client requestWithResourcePath:@"/login.php"];
    req.method = RKRequestMethodPOST;
    NSDictionary *loginParams = [NSDictionary dictionaryWithKeysAndObjects:@"username", @"ridejkcl", @"password", @"haha yeah right", @"keeplogged", @"1", @"login", @"Login", nil];
    req.params = loginParams;
    req.followRedirect = YES;
    res = [req sendSynchronously];
    
    // TODO do something here to check if properly logged in
    
    // finally, get authkey and whatnot
    req = [self.client requestWithResourcePath:@"/ajax.php?action=index"];
    res = [req sendSynchronously];
    NSString *body = [[NSString alloc]initWithData:res.body encoding:NSUTF8StringEncoding];
    NSLog(@"%@", body);
}

- (void)testRequestInbox {
    RKRequest *req = [self.client requestWithResourcePath:@"/ajax.php?action=inbox"];
    RKResponse *res = [req sendSynchronously];
    NSString *body = [[NSString alloc]initWithData:res.body encoding:NSUTF8StringEncoding];
    NSLog(@"%@", body);
}

@end
