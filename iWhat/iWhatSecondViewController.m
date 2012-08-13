//
//  iWhatSecondViewController.m
//  iWhat
//
//  Created by James Rollenhagen on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "iWhatSecondViewController.h"
#import "WhatAPI.h"

@interface iWhatSecondViewController ()

@property (nonatomic, strong) WhatAPI *api;

@end

@implementation iWhatSecondViewController

@synthesize api = _api;

- (WhatAPI *)api {
    if (!_api) {
        _api = [[WhatAPI alloc] init];
    }
    return _api;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)doSomethingElse {
    NSLog(@"Doing something else!");
    //[self.api testRequestInbox];
}

@end
