//
//  AnimationToViewController.m
//  Lottie-example
//
//  Created by zero on 2017/8/23.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "AnimationToViewController.h"

@interface AnimationToViewController ()

@property(nonatomic,strong) UIButton *transiBtn; //
@property(nonatomic,strong) UIButton *closeBtn; //
@end

@implementation AnimationToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.transiBtn];
    self.view.backgroundColor = [UIColor orangeColor];
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
}
//********Life cycle********//


- (void)_close {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (UIButton *)transiBtn{
    if (!_transiBtn) {
        _transiBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_transiBtn setTitle:@"B" forState:UIControlStateNormal];
        [_transiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _transiBtn.backgroundColor = [UIColor colorWithRed:50.f/255.f
                                                     green:207.f/255.f
                                                      blue:193.f/255.f
                                                     alpha:1.f];
        _transiBtn.layer.cornerRadius = 7;
        
        [_transiBtn addTarget:self action:@selector(_close) forControlEvents:UIControlEventTouchUpInside];
    }
    return _transiBtn;
}


@end
