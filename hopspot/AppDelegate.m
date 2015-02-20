//
//  AppDelegate.m
//  hopspot
//
//  Created by George Luo on 8/27/14.
//  Copyright (c) 2014 ___hopspotproductions___. All rights reserved.
//

#import "AppDelegate.h"
#import "SRWebSocket.h"
#import "FeedTableViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface TCMessage : NSObject


- (id)initWithMessage:(NSString *)message fromMe:(BOOL)fromMe;

@property (nonatomic, retain, readonly) NSString *message;
@property (nonatomic, readonly)  BOOL fromMe;

@end

@interface AppDelegate () <SRWebSocketDelegate, UITextViewDelegate>

@end

@implementation AppDelegate {
    
    SRWebSocket *_webSocket;
    NSMutableArray *_messages;
    NSString *string;
    NSMutableArray *_posts;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [GMSServices provideAPIKey:@"AIzaSyBMluOQpkdmfUbZC5JsjgubbwJYpSzJ46c"];
    [self _reconnect];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)_reconnect;
{
    _webSocket.delegate = nil;
    [_webSocket close];
    
    _webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://192.168.1.141:160/chat"]]];
    _webSocket.delegate = self;
    [_webSocket open];
    //[self performSelector:@selector(sendMessage) withObject:nil afterDelay:5];
}

- (void)reconnect:(id)sender;
{
    [self _reconnect];
}

- (void) sendMessage:(NSString*) message;
{
    [_webSocket send:message];
}

- (void) sendMessageDefault;
{
    [_webSocket send:@"sent from post view"];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message;
{
    NSLog(@"Received \"%@\"", message);
    [_messages addObject:[[TCMessage alloc] initWithMessage:message fromMe:NO]];
    
    NSArray *decodelist = [message componentsSeparatedByString:@">:>"];
    NSString *requestType = [decodelist objectAtIndex:0];
        
    if ([requestType isEqualToString:@"regionFeed"])
    {
        [self.feedViewController fillFeed:decodelist];
    }
    
    if([requestType isEqualToString:@"hopSpots"])
    {
        [self.navigateViewController fillNavigate:decodelist];
    }
    
    if([requestType isEqualToString:@"hopSpotFeed"])
    {
        [self.navigateViewController fillHopSpotNav:decodelist];
    }
    
    if([requestType isEqualToString:@"HopSpotIDs"])
    {
    
    }
    if([requestType isEqualToString:@"HopSpotNames"])
    {
    
    }
    if([requestType isEqualToString:@"CircleMap"])
    {
    
    }
}

@end

@implementation TCMessage

@synthesize message = _message;
@synthesize fromMe = _fromMe;

- (id)initWithMessage:(NSString *)message fromMe:(BOOL)fromMe;
{
    self = [super init];
    if (self) {
        _fromMe = fromMe;
        _message = message;
    }
    
    return self;
}

@end

