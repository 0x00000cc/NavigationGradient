# 页面切换导航栏渐变，类似QQ导航栏效果。
页面透明和不透明之间的切换 不同颜色之间的切换

![QQ导航栏效果](http://ojv3cz63y.bkt.clouddn.com/QQ导航栏效果.gif)

**注1** 通过集成基类来实现效果  
**注2** 自定义UINavigationController类的原因有两种 <br>
1. 首先自定义左上角返回按钮会造成右滑手势失效，可在基类nav里给所有页面添加右滑手势代理，让程序可以继续使用右滑返回。<br>
2. 实现了第一步之后会出现一级页面也响应右滑返回手势的BUG，会出现推出下一页面，当前页面卡死的bug，再右滑会出现明显的错误切换，在基类nav里重写手势返回的`- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer`方法，可以来控制右滑手势是否响应。
3. 如果想要状态栏可以改变白色或者黑色两种样式可以建一个navigationcontroller的category，在.m里实现下面两个方法。
```
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.visibleViewController;
}
- (UIViewController *)childViewControllerForStatusBarHidden{
    return self.visibleViewController;
}
```
