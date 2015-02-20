//
//  PostViewController.m
//  hopspot
//
//  Created by George Luo on 10/16/14.
//  Copyright (c) 2014 ___hopspotproductions___. All rights reserved.
//

#import "PostViewController.h"
#import "AppDelegate.h"

@interface PostViewController ()


@end

@implementation PostViewController  {
    AppDelegate *appDelegate;
}

@synthesize PostField = _PostField;

- (IBAction)sendClicked:(id)sender {
    NSString* text = _PostField.text;
    NSString* toSend = [NSString stringWithFormat:@"postToGeneral/%%/%@%@%@%@", text, @"/%/1", @"/%/", @"apple"];
    [appDelegate sendMessage:toSend];
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
