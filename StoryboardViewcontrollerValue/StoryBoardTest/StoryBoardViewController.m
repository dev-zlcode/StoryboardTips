//
//  StoryBoardViewController.m
//  StoryBoardTest
//
//  Created by zhanglei on 16/4/29.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "StoryBoardViewController.h"

#import "DetailViewController.h"
#import "CodeViewController.h"
#import "XibViewController.h"

@interface StoryBoardViewController ()

@end

@implementation StoryBoardViewController

/*
 于StoryBoard相关的类
 
 1 UIStoryboard
 
 // 根据StoryBoard名字获取StoryBoard
 + (UIStoryboard *)storyboardWithName:(NSString *)name bundle:(nullable NSBundle *)storyboardBundleOrNil;
 
 // 获取指定StoryBoard的第一个视图控制器
 - (nullable __kindof UIViewController *)instantiateInitialViewController;
 
 // 获取指定StoryBoard的标识符为identifier的视图控制器
 - (__kindof UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)identifier;
 
 2 UIStoryboardSegue
 
 // 标识符
 @property (nullable, nonatomic, copy, readonly) NSString *identifier;
 // 源视图控制器
 @property (nonatomic, readonly) __kindof UIViewController *sourceViewController;
 // 目的视图控制器
 @property (nonatomic, readonly) __kindof UIViewController *destinationViewController;
 
 3 UIStoryboardUnwindSegueSource
 4 UIStoryboardPopoverSegue
 
 5 UIViewController
 
 // 处理标识符为identifier的StoryBoardSegue
 - (void)performSegueWithIdentifier:(NSString *)identifier sender:(nullable id)sender NS_AVAILABLE_IOS(5_0);
 
 */
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

// StoryBoard 跳转到 StoryBoard
- (IBAction)StoryBoardCodePush2Button:(id)sender
{
    // 连线和未连线都可以
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *vc = [story instantiateViewControllerWithIdentifier:@"VC"];
    vc.name = @"StoryBoard Code2 Push";
    
    [self.navigationController pushViewController:vc animated:YES];
}

// StoryBoard 跳转到 Code
- (IBAction)StoryBoardtoCodeVCPush:(id)sender
{
    CodeViewController *vc = [[CodeViewController alloc] init];
    vc.name = @"StoryBoard to CodeVC Push";
    [self.navigationController pushViewController:vc animated:YES];
}

// StoryBoard 跳转到 Xib
- (IBAction)StoryBoardtoXibVCPush:(id)sender
{
    XibViewController *vc = [[XibViewController alloc] init];
    vc.name = @"StoryBoard to XibVC Push";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
