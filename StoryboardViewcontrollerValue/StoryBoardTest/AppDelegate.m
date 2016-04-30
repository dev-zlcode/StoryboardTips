//
//  AppDelegate.m
//  StoryBoardTest
//
//  Created by zhanglei on 16/4/29.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    // 代码动态加载StoryBoard，TARGETS设置中Deployment Info 项Main Interface删除main
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
//    self.window.rootViewController = vc;
    
    return YES;
}

@end
