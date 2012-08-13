//
//  iWhatAppDelegate.m
//  iWhat
//
//  Created by James Rollenhagen on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "iWhatAppDelegate.h"
#import "WhatAPI.h"
#import "WhatAPIUser.h"
#import <Restkit/Restkit.h>

@implementation iWhatAppDelegate

@synthesize window = _window;
@synthesize masx = _masx;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // workaround what.cd's API returning text/plain
    Class<RKParser> parser = [[RKParserRegistry sharedRegistry] parserClassForMIMEType:@"application/json"];
    [[RKParserRegistry sharedRegistry] setParserClass:parser forMIMEType:@"text/plain"];
    
    // initialize and login to the api
    [RKClient clientWithBaseURLString:@"https://ssl.what.cd"];
    WhatAPI *api = [[WhatAPI alloc] init];
    [api loginUser];
    [api testRequestInbox];
    
    //[self.masx loadUser];
    self.masx = [WhatAPIUser initUserWithUserID:154962];
    NSLog(@"%@", self.masx.username);
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
