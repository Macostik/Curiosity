
//
//  AppDelegate.m
//  Curiosity
//
//  Created by Yuriy Granchenko on 18.04.14.
//  Copyright (c) 2014 Yuriy Granchenko. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

+ (instancetype)instance {
    static AppDelegate *appDelegate = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appDelegate = [[self alloc] init];
    });
    
    return appDelegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	NSDictionary *token = [CachingAppToken readData];
    NSString *controllerID = token[kAccessTokenKey] ? kTabBarControlIdentity : kLogControlIdentity;
	UIViewController *initViewController = [AppDelegate initViewController:controllerID];
    
    if (token[kAccessTokenKey]) {
		if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
			[FBSession openActiveSessionWithReadPermissions:kRequestedPermissions
											   allowLoginUI:NO
										  completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
											  [self.window setRootViewController:initViewController];
										  }];
		}
    } else {
        [(UINavigationController *)self.window.rootViewController pushViewController:initViewController animated:NO];
	}
    return YES;
}

+ (UIViewController *)initViewController:(NSString *)controllerID {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	return [storyboard instantiateViewControllerWithIdentifier:controllerID];
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[FBAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[self.session close];
}

-(BOOL)application:(UIApplication *)application
		   openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication
		annotation:(id)annotation {
	return [FBAppCall handleOpenURL:url sourceApplication:sourceApplication withSession:self.session];
}

@end
