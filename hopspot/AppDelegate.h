//
//  AppDelegate.h
//  hopspot
//
//  Created by George Luo on 8/27/14.
//  Copyright (c) 2014 ___hopspotproductions___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedTableViewController.h"
#import "NavTableViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (weak, nonatomic) FeedTableViewController *feedViewController;

@property (weak, nonatomic) NavTableViewController *navigateViewController;

@property (strong, nonatomic) UIWindow *window;

//Interface builder action
- (IBAction)reconnect:(id)sender;

- (void) sendMessage:(NSString*) message;

@end
