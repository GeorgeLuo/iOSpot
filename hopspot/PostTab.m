//
//  PostTab.m
//  hopspot
//
//  Created by George Luo on 12/16/14.
//  Copyright (c) 2014 ___hopspotproductions___. All rights reserved.
//

#import "PostTab.h"

@implementation PostTab

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
