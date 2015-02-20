//
//  NavTableViewController.h
//  hopspot
//
//  Created by George Luo on 9/4/14.
//  Copyright (c) 2014 ___hopspotproductions___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewController : UITableViewController <NSStreamDelegate>

@property (nonatomic, strong) NSMutableArray *posts;

- (void) fillFeed:(NSArray*) feedData;

@end
