//
//  CustomTransitionAnimator.h
//  CustomViewControllerTransition
//
//  Created by dql on 14/11/26.
//  Copyright (c) 2014年 dql. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic,assign) BOOL presenting;
@end
