//
//  SearchViewController.m
//  StoryBoardTest
//
//  Created by zhanglei on 16/5/1.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    segue.destinationViewController.hidesBottomBarWhenPushed = YES;
}

@end
