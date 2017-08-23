//
//  ViewController.m
//  Lottie-example
//
//  Created by zero on 2017/8/22.
//  Copyright © 2017年 zero. All rights reserved.
//

#import "ViewController.h"
#import <Lottie/Lottie.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableview; //
@property(nonatomic,strong) NSArray *dataSource; //

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    headView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.tableview.tableHeaderView = headView;
    [self.view addSubview:self.tableview];
    
    LOTAnimationView *animation = [LOTAnimationView animationNamed:@"skeleton_frame_loading"];
    [self.tableview addSubview:animation];
    [animation playWithCompletion:^(BOOL animationFinished) {
        [animation removeFromSuperview];
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLayoutSubviews{
    self.tableview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataSource[indexPath.row][@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *vcClassName = self.dataSource[indexPath.row][@"vc"];
    Class vcClass = NSClassFromString(vcClassName);
    if (vcClass) {
        UIViewController *vc = [[vcClass alloc] init];
        [self presentViewController:vc animated:YES completion:NULL];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}

- (NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@{@"name" : @"Animation Explorer",
                          @"vc" : @"AnimationExplorerViewController"},
                        @{@"name" : @"Animated Keyboard",
                          @"vc" : @"TypingDemoViewController"},
                        @{@"name" : @"Animated Transitions Demo",
                          @"vc" : @"AnimationTransitionViewController"}];
    }
    return _dataSource;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
