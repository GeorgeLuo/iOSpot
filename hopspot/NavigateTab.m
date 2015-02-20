//
//  NavigateTab.m
//  hopspot
//
//  Created by George Luo on 9/4/14.
//  Copyright (c) 2014 ___hopspotproductions___. All rights reserved.
//

#import "NavigateTab.h"

@implementation NavigateTab

@synthesize name = _name;

- (id) initWithName:(NSString *)name{
    self = [super init];
    if(self)
    {
        self.name = name;
    }
    return self;
}

@end
