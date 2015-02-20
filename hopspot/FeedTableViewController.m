//
//  NavTableViewController.m
//  hopspot
//
//  Created by George Luo on 9/4/14.
//  Copyright (c) 2014 ___hopspotproductions___. All rights reserved.
//

#import "FeedTableViewController.h"
#import "PostTab.h"
#import "AppDelegate.h"

@interface FeedTableViewController ()

@end

@implementation FeedTableViewController {
    AppDelegate *appDelegate;
}

@synthesize posts = _posts;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

//onclick tab action - TODO
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    if([cellText isEqualToString:@"First Post"])
    {

    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.feedViewController = self;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.posts = [[NSMutableArray alloc] init];
    
    BOOL serverConnected = false;
    
    while (!serverConnected) {
        @try {
            [appDelegate sendMessage:@"getRegionBoard/%/1"];
            serverConnected = true;
        }
        @catch (NSException *exception) {
            usleep(1000000);
        }
    }
    
    
//    PostTab *testTab = [[PostTab alloc] initWithName:@"First Post"];
    
//    [self.posts addObject:testTab];
//    [self.posts addObject:testTab];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PostTab *currNT = [self.posts objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Feed" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = currNT.name;
    
    return cell;
}

- (void) fillFeed:(NSArray *)feedData {
    [self.posts removeAllObjects];
    
    NSString *content = [feedData objectAtIndex:1];
    NSArray *temp = [content componentsSeparatedByString:@"/@$/"];
    
    NSInteger feedCount = [temp count];
    
    for(int i = 0; i < feedCount; i++)
    {
        PostTab *testTab = [[PostTab alloc] initWithName:[temp objectAtIndex:i]];
        [self.posts addObject:testTab];
    }
    
    [self.tableView reloadData];
    
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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
