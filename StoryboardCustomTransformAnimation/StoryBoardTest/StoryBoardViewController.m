//
//  StoryBoardViewController.m
//  StoryBoardTest
//
//  Created by zhanglei on 16/4/29.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "StoryBoardViewController.h"

#import "DetailViewController.h"

@interface StoryBoardViewController ()

@end

@implementation StoryBoardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

// UIViewController 方法 用于处理视图控制器之间的传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSLog(@"%@___%@",segue,sender);
    
    if ([sender isKindOfClass:[UIButton class]])
    {
        // 方法一,使用KVC给B 也就是目标场景传值
        UIViewController *destinationController=[segue destinationViewController];
        [destinationController setValue:@"StoryBoard Segue Push" forKey:@"name"];
    }
    else
    {
        // 方法2,使用属性传值,需导入相关的类.h
        
        DetailViewController *bController=[segue destinationViewController];
        bController.name=@"StoryBoard Code Push";
    }
}

// StoryBoard 跳转到 StoryBoard
- (IBAction)StoryBoardSeguePushButton:(id)sender
{
    
}

// StoryBoard 跳转到 StoryBoard
- (IBAction)StoryBoardCodePushButton:(id)sender
{
    // 已经连线的seg
    [self performSegueWithIdentifier:@"Detail" sender:self];
}

@end
