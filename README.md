# Lottie-Example
##使用Lottie
Lottie支持iOS 8 及其以上系统。当我们把动画需要的images资源文件添加到Xcode的目标工程的后，Lottie 就可以通过JSON文件或者包含了JSON文件的URL来加载动画。

最简单的方式是用LOTAnimationView来使用它
````
LOTAnimationView *animation = [LOTAnimationView animationNamed:@"Lottie"];
[self.view addSubview:animation];
[animation playWithCompletion:^(BOOL animationFinished) {
  // Do Something
}];
````
如果你使用到了多个bundle文件，你可以这么做：
````
LOTAnimationView *animation = [LOTAnimationView animationNamed:@"Lottie" inBundle:[NSBundle YOUR_BUNDLE]];
[self.view addSubview:animation];
[animation playWithCompletion:^(BOOL animationFinished) {
  // Do Something
}];
````
或者你可以用代码通过NSURL来加载
````
LOTAnimationView *animation = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:URL]];
[self.view addSubview:animation];
````
Lottie 支持iOS中的UIViewContentModes的 aspectFit, aspectFill 和 scaleFill这些属性。

你可以控制动画的进度
````
CGPoint translation = [gesture getTranslationInView:self.view];
CGFloat progress = translation.y / self.view.bounds.size.height;
animationView.animationProgress = progress;
````
想要任意视图来给Lottie View中的动画图层做遮罩吗 ？只要你知道After Effects中对应的图层的名字，那就是小菜一碟的事了：
````
UIView *snapshot = [self.view snapshotViewAfterScreenUpdates:YES];
[lottieAnimation addSubview:snapshot toLayerNamed:@"AfterEffectsLayerName"];
````
Lottie 带有一个UIViewController动画控制器，可以用来自定义转场动画！

````
#pragma mark -- View Controller Transitioning

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
  LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"vcTransition1"
fromLayerNamed:@"outLayer"
                                                                                                            toLayerNamed:@"inLayer"];
  return animationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
  LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"vcTransition2"
                                                                                                          fromLayerNamed:@"outLayer"
                                                                                                            toLayerNamed:@"inLayer"];
  return animationController;
}
````

