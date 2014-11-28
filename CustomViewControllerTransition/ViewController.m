//
//  ViewController.m
//  CustomViewControllerTransition
//
//  Created by dql on 14/11/26.
//  Copyright (c) 2014年 dql. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "CustomTransitionAnimator.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 100, 40);
    [button setTitle:@"跳到下一界面" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClicked:(UIButton *)button
{
    SecondViewController* secondVC = [[SecondViewController alloc] init];
    secondVC.transitioningDelegate = self;
    secondVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:secondVC animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    CustomTransitionAnimator * animator = [CustomTransitionAnimator new];
    animator.presenting = YES;
    return animator;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    CustomTransitionAnimator * animator = [CustomTransitionAnimator new];
    return animator;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

@end
