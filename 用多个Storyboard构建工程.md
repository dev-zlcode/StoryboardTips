# 用多个StoryBoard构建工程

### 一 重新创建Home、Search和About两个StoryBoard

![图例1](http://blog.zlcode.com/wp-content/uploads/2016/05/more-storyboard-build-project-1.png)

![图例2](http://blog.zlcode.com/wp-content/uploads/2016/05/more-storyboard-build-project-2.png)

![图例3](http://blog.zlcode.com/wp-content/uploads/2016/05/more-storyboard-build-project-3.png)

### 二 创建TabBarViewController类继承于UITabBarController

```
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

```

### 三 为每个Storyboard添加Storyboard Entry Point

运行工程时发现报错那是因为没有为每个Storyboard添加Storyboard Entry Point，按照下面的步骤操作即可。

![图例1](http://blog.zlcode.com/wp-content/uploads/2016/05/more-storyboard-build-project-4.png)

![图例2](http://blog.zlcode.com/wp-content/uploads/2016/05/more-storyboard-build-project-5.png)

### 四 从一个StoryBoard的某一个视图push到另一个StoryBoard的某一个视图

![图例6](http://blog.zlcode.com/wp-content/uploads/2016/05/more-storyboard-build-project-6.png)


```
- (IBAction)storyboardToAbout:(id)sender
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"About" bundle:nil];
    AboutViewController *vc = [story instantiateViewControllerWithIdentifier:@"VC"];
    
    [self.navigationController pushViewController:vc animated:YES];
}

```

最终的效果图
![图例7](http://blog.zlcode.com/wp-content/uploads/2016/05/more-storyboard-build-project-7.png)

[完整项目代码](https://github.com/YiQieSuiYuan/StoryboardTips/tree/master/MoreStoryboardBuildProject)

### 五 参考

[iOS storyboard 添加Entry point](http://www.07net01.com/2015/07/888152.html)