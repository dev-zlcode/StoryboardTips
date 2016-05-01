# Storyboard 自定义转场动画

> 在storyboard中，segue有几种不同的类型，在iphone和ipad的开发中，segue的类型是不同的。在iphone中，segue有：push，modal，和custom三种不同的类型，这些类型的区别在与新页面出现的方式。而在ipad中，有push，modal，popover，replace和custom五种不同的类型。

### 1 自定义DetailStoryboardSegue类继承于UIStoryboardSegue


```
// 这个类用于处理跳转动画

- (instancetype)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    self = [super initWithIdentifier:identifier source:source destination:destination];
    if (self)
    {
        
    }
    return self;
}

- (void)perform
{
// 如果使用系统的转场动画则不注释，如果使用自定义转场动画则重写该放法。
//    [super perform];
    
    // 自定义转成动画代码部分
    UIViewController *source = self.sourceViewController;
    UIViewController *destination = self.destinationViewController;
    
    // Create a UIImage with the contents of the destination
    UIGraphicsBeginImageContext(destination.view.bounds.size);
    [destination.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *destinationImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Add this image as a subview to the tab bar controller
    UIImageView *destinationImageView = [[UIImageView alloc] initWithImage:destinationImage];
    [source.parentViewController.view addSubview:destinationImageView];
    
    // Scale the image down and rotate it 180 degrees (upside down)
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(0.1, 0.1);
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(M_PI);
    destinationImageView.transform = CGAffineTransformConcat(scaleTransform, rotateTransform);
    
    // Move the image outside the visible area
    CGPoint oldCenter = destinationImageView.center;
    CGPoint newCenter = CGPointMake(oldCenter.x - destinationImageView.bounds.size.width, oldCenter.y);
    destinationImageView.center = newCenter;
    
    // Start the animation
    [UIView animateWithDuration:0.5f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void) {
                         destinationImageView.transform = CGAffineTransformIdentity;
                         destinationImageView.center = oldCenter;
                     }
                     completion: ^(BOOL done) {
                         // Remove the image as we no longer need it
                         [destinationImageView removeFromSuperview];
                         
                         // Properly present the new screen
                         [source.navigationController pushViewController:destination animated:nil];
                     }];
}

```

### 2 在Storyboard中设置

![图例1](http://blog.zlcode.com/wp-content/uploads/2016/05/storyboard-custom-transform-animation-1.png)

[完整代码下载](https://github.com/YiQieSuiYuan/StoryboardTips/tree/master/StoryboardCustomTransformAnimation)
[官方Storyboard例子下载](https://developer.apple.com/library/ios/samplecode/CustomTransitions/Introduction/Intro.html)


