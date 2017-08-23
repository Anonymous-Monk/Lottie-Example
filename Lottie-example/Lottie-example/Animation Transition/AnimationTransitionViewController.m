//
//  AnimationTransitionViewController.m
//  Lottie-example
//
//  Created by zero on 2017/8/23.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "AnimationTransitionViewController.h"
#import "AnimationToViewController.h"
#import <Lottie/Lottie.h>

@interface AnimationTransitionViewController ()<UIViewControllerTransitioningDelegate>
@property(nonatomic,strong) UIButton *transiBtn; //
@property(nonatomic,strong) UIButton *closeBtn; //
@end

@implementation AnimationTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.transiBtn];
    [self.view addSubview:self.closeBtn];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

//********Life cycle********//
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    self.transiBtn.frame = CGRectMake((width - 100)/2, (height - 30)/2, 100, 30);
    self.closeBtn.frame = CGRectMake((width - 60)/2, height - 45, 60, 30);
}
//********Life cycle********//


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_showTransitionA{
    AnimationToViewController *toVC = [[AnimationToViewController alloc]init];
    toVC.transitioningDelegate = self;
    [self presentViewController:toVC animated:YES completion:NULL];
}

- (void)_close{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


#pragma mark -- View Controller Transitioning

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"vcTransition1"
                                                                                                              fromLayerNamed:@"outLayer"
                                                                                                                toLayerNamed:@"inLayer"
                                                                                                     applyAnimationTransform:NO];
    

    return animationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"vcTransition2"
                                                                                                              fromLayerNamed:@"outLayer"
                                                                                                                toLayerNamed:@"inLayer"
                                                                                                     applyAnimationTransform:NO];
    return animationController;
}

- (UIButton *)closeBtn{
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_closeBtn setTitle:@"Close" forState:UIControlStateNormal];
        [_closeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _closeBtn.backgroundColor = [UIColor colorWithRed:50.f/255.f
                                                    green:207.f/255.f
                                                     blue:193.f/255.f
                                                    alpha:1.f];
        _closeBtn.layer.cornerRadius = 7;
        
        [_closeBtn addTarget:self action:@selector(_close) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}

- (UIButton *)transiBtn{
    if (!_transiBtn) {
        _transiBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_transiBtn setTitle:@"A" forState:UIControlStateNormal];
        [_transiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _transiBtn.backgroundColor = [UIColor colorWithRed:50.f/255.f
                                                     green:207.f/255.f
                                                      blue:193.f/255.f
                                                     alpha:1.f];
        _transiBtn.layer.cornerRadius = 7;
        
        [_transiBtn addTarget:self action:@selector(_showTransitionA) forControlEvents:UIControlEventTouchUpInside];
    }
    return _transiBtn;
}


@end
