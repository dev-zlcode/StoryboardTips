//
//  AppDelegate.m
//  StoryBoardTest
//
//  Created by zhanglei on 16/4/29.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "AppDelegate.h"

#import "TabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    TabBarViewController *tabVC = [[TabBarViewController alloc] init];
    self.window.rootViewController = tabVC;
    
    return YES;
}

@end
