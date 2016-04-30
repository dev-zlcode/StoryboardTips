# StoryBoard 视图切换和传值
> 如果习惯使用纯代码编程的开发者，会感觉使用StoryBoard会非常不舒服，但是看完本教程能让你快速使用StoryBoard开发。StoryBoard和StoryBoard、StoryBoard和Code视图控制器、StoryBoard和Xib视图控制器之间切换和传值。

### 一 于StoryBoard相关的类、方法和属性

##### 1 UIStoryboard

```
 // 根据StoryBoard名字获取StoryBoard
 + (UIStoryboard *)storyboardWithName:(NSString *)name bundle:(nullabßle NSBundle *)storyboardBundleOrNil;
 
 // 获取指定StoryBoard的第一个视图控制器
 - (nullable __kindof UIViewController *)instantiateInitialViewController;
 
 // 获取指定StoryBoard的标识符为identifier的视图控制器
 - (__kindof UIViewController *)instantiateViewControllerWithIdentifier:(NSString *)identifier;
```

##### 2 UIStoryboardSegue

```
 // 标识符
 @property (nullable, nonatomic, copy, readonly) NSString *identifier;
 // 源视图控制器
 @property (nonatomic, readonly) __kindof UIViewController *sourceViewController;
 // 目的视图控制器
 @property (nonatomic, readonly) __kindof UIViewController *destinationViewController;
```

##### 3 UIStoryboardUnwindSegueSource

##### 4 UIStoryboardPopoverSegue

##### 5 UIViewController

```
 // 处理标识符为identifier的StoryBoardSegue
 - (void)performSegueWithIdentifier:(NSString *)identifier sender:(nullable id)sender NS_AVAILABLE_IOS(5_0);
```

### 二 动态加载StoryBoard
AppDelegate.m
动态加载StoryBoard，TARGETS设置中Deployment Info 项Main Interface删除main

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    self.window.rootViewController = vc;
    
    return YES;
}
```

### 三 StoryBoard->StoryBoard切换和传值

![图例1](http://blog.zlcode.com/wp-content/uploads/2016/05/storyboard-viewcontroller-value-1.png)

##### 1 视图切换
方法一：

![图例2](http://blog.zlcode.com/wp-content/uploads/2016/05/storyboard-viewcontroller-value-2.png)

方法二：

![图例4](http://blog.zlcode.com/wp-content/uploads/2016/05/storyboard-viewcontroller-value-4.png)

```
// StoryBoard 跳转到 StoryBoard
- (IBAction)StoryBoardCodePushButton:(id)sender
{
    // 已经连线的seg
    [self performSegueWithIdentifier:@"Detail" sender:self];
}
```

##### 2 视图传值

```
// UIViewController 方法 用于处理视图控制器之间的传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
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
```

### 四 StoryBoard->Code视图控制器切换和传值（Xib视图控制器原理一样）

self视图控制器是用StoryBoard创建的

```
// StoryBoard 跳转到 Code
- (IBAction)StoryBoardtoCodeVCPush:(id)sender
{
    CodeViewController *vc = [[CodeViewController alloc] init];
    vc.name = @"StoryBoard to CodeVC Push";
    [self.navigationController pushViewController:vc animated:YES];
}
```

### 五 Code视图控制器->StoryBoard切换和传值（Xib视图控制器原理一样）

![图例3](http://blog.zlcode.com/wp-content/uploads/2016/05/storyboard-viewcontroller-value-3.png)

self视图控制器是用Code（Xib）创建的

```
- (void)barButton
{
    // 从Code视图控制器跳转到StoryBoard中的视图控制器 （Xib原理一样）
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *vc = [story instantiateViewControllerWithIdentifier:@"VC"];
    vc.name = @"Code to StoryBoard Push";
    
    [self.navigationController pushViewController:vc animated:YES];
}
```

[完整工程代码](https://github.com/YiQieSuiYuan/StoryboardTips/tree/master/StoryboardViewcontrollerValue)

### 六 参考

[AppDelegate动态加载StoryBoard](http://blog.csdn.net/huanghuanghbc/article/details/8530997)

