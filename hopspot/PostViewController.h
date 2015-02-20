//
//  PostViewController.h
//  hopspot
//
//  Created by George Luo on 10/16/14.
//  Copyright (c) 2014 ___hopspotproductions___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSTBViewController.h"

@interface PostViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *SendButton;

@property (weak, nonatomic) IBOutlet UITextView *PostField;

@property (nonatomic, assign) HSTBViewController *hstbViewContrl;

@end
