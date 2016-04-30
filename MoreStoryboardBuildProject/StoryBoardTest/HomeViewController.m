//
//  HomeViewController.m
//  StoryBoardTest
//
//  Created by zhanglei on 16/5/1.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "HomeViewController.h"

#import "AboutViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    segue.destinationViewController.hidesBottomBarWhenPushed = YES;
}

// 从一个StoryBoard的某一个视图push到另一个StoryBoard的某一个视图
- (IBAction)storyboardToAbout:(id)sender
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"About" bundle:nil];
    AboutViewController *vc = [story instantiateViewControllerWithIdentifier:@"VC"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
