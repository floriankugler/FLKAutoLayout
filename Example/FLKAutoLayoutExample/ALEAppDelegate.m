//
//  ALEAppDelegate.m
//  FLKAutoLayoutExample
//
//  Created by Florian on 03/25/13.
//

#import "ALEAppDelegate.h"
#import "ALEViewController.h"

@implementation ALEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ALEViewController alloc] init];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end