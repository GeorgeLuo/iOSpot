//
//  HSTBViewController.m
//  hopspot
//
//  Created by George Luo on 9/13/14.
//  Copyright (c) 2014 ___hopspotproductions___. All rights reserved.
//

#import "HSTBViewController.h"

@interface HSTBViewController ()

@end

@implementation HSTBViewController {

    NSMutableArray *_messages;
    NSString *string;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _messages = [[NSMutableArray alloc] init];
    string = [[NSString alloc] init];
    [self setSelectedIndex:1];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    string = @"string changed to this";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
