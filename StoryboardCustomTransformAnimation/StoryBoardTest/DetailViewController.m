//
//  DetailViewController.m
//  StoryBoardTest
//
//  Created by zhanglei on 16/5/1.
//  Copyright © 2016年 zhanglei. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.label.text = self.name;
}

@end
