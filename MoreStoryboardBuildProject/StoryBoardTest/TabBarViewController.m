//
//  TabBarViewController.m
//  StoryBoardTest
//
//  Created by zhanglei on 16/5/1.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //第一个 首页
    UINavigationController *homeNav = [[UIStoryboard storyboardWithName:@"Home" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:0];
    homeNav.tabBarItem = homeItem;
    homeNav.title = @"首页";
    
    //第二个 主页
    UINavigationController *searchNav = [[UIStoryboard storyboardWithName:@"Search" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    UITabBarItem *searchItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
    searchNav.tabBarItem = searchItem;
    searchNav.title = @"搜索";

    //第三个 关于
    UINavigationController *aboutNav = [[UIStoryboard storyboardWithName:@"About" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
    UITabBarItem *aboutItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    aboutNav.tabBarItem = aboutItem;
    aboutNav.title = @"观月";
    
    // 将视图控制器添加至数组中
    NSArray *viewControllers = @[homeNav,searchNav,aboutNav];
    self.viewControllers = viewControllers;
}

@end
