//
//  CodeViewController.m
//  StoryBoardTest
//
//  Created by zhanglei on 16/5/1.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "CodeViewController.h"

#import "DetailViewController.h"

@interface CodeViewController ()

@end

@implementation CodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 导航右边按钮响应
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"StoryBoard" style:UIBarButtonItemStylePlain target:self action:@selector(barButton)];
    self.navigationItem.rightBarButtonItem = barButton;
    
    // label 显示信息
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    label.text = self.name;
}

#pragma mark - 导航右边按钮响应
- (void)barButton
{
    // 从Code视图控制器跳转到StoryBoard中的视图控制器 （Xib原理一样）
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *vc = [story instantiateViewControllerWithIdentifier:@"VC"];
    vc.name = @"Code to StoryBoard Push";
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
