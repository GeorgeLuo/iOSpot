//
//  NavTableViewController.h
//  hopspot
//
//  Created by George Luo on 9/4/14.
//  Copyright (c) 2014 ___hopspotproductions___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavTableViewController : UITableViewController <NSStreamDelegate>

@property (nonatomic, strong) NSMutableArray *bars;

- (void) fillNavigate:(NSArray*) navData;
- (void) fillHopSpotNav:(NSArray *)barData;

@end
