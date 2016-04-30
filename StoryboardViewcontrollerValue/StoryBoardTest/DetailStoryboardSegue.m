//
//  DetailStoryboardSegue.m
//  StoryBoardTest
//
//  Created by zhanglei on 16/5/1.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "DetailStoryboardSegue.h"

@implementation DetailStoryboardSegue

// 这个类用于处理跳转动画

- (instancetype)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    self = [super initWithIdentifier:identifier source:source destination:destination];
    if (self)
    {
        NSLog(@"%@___%@____%@",identifier,source,destination);
    }
    
    return self;
}

@end
