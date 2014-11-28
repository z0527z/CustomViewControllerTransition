//
//  CustomTransitionAnimator.m
//  CustomViewControllerTransition
//
//  Created by dql on 14/11/26.
//  Copyright (c) 2014年 dql. All rights reserved.
//

#import "CustomTransitionAnimator.h"

@implementation CustomTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 2.5f;
}

//- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
//{
//    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    
//    [transitionContext.containerView addSubview:fromViewController.view];
//    [transitionContext.containerView addSubview:toViewController.view];
//    
//    if(self.presenting){
//        fromViewController.view.userInteractionEnabled = NO;
//        
//        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:0.4 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            fromViewController.view.alpha = 0.5f;
//            toViewController.view.frame = CGRectInset(fromViewController.view.frame, 40, 40);
//        } completion:^(BOOL finished) {
//            [transitionContext completeTransition:finished];
//        }];
//    }else{
//        
//        [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            toViewController.view.alpha = 1.0f;
//            toViewController.view.userInteractionEnabled = YES;
//            
//            fromViewController.view.transform = CGAffineTransformConcat(CGAffineTransformScale(fromViewController.view.transform, 0.2, 0.2), CGAffineTransformRotate(fromViewController.view.transform, -1.5));
//        } completion:^(BOOL finished) {
//
//            [transitionContext completeTransition:finished];
//        }];
//    }
//}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    [transitionContext.containerView addSubview:fromViewController.view];
    [transitionContext.containerView addSubview:toViewController.view];
    
    if (self.presenting) {
//        fromViewController.view.userInteractionEnabled = NO;
//        fromViewController.view.alpha = 1.0f;
        toViewController.view.userInteractionEnabled = NO;
        toViewController.view.alpha = 0.0f;
        toViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//            fromViewController.view.alpha = 0.1f;
            toViewController.view.alpha = 1.0f;
            toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
            toViewController.view.userInteractionEnabled = YES;
            [transitionContext completeTransition:finished];
        }];
    }
    else {
        fromViewController.view.alpha = 1.0f;
        fromViewController.view.userInteractionEnabled = NO;
        fromViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        toViewController.view.userInteractionEnabled = NO;
        toViewController.view.alpha = 0.0f;
        toViewController.view.transform = CGAffineTransformMakeScale(0.0, 0.0);
        
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.alpha = 0.0f;
            fromViewController.view.transform = CGAffineTransformScale(fromViewController.view.transform, 0.5, 0.5);
            toViewController.view.alpha = 1.0f;
            toViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
            toViewController.view.userInteractionEnabled = YES;
//            toViewController.view.alpha = 1.0f;
            [transitionContext completeTransition:finished];
            
            // IOS8下，动画完后，UIWindow会空掉，所以要从新添加下
            [[UIApplication sharedApplication].keyWindow addSubview:toViewController.view];
            NSLog(@"subViews:%@", [UIApplication sharedApplication].keyWindow.subviews);
        }];
        
    }
}


@end
