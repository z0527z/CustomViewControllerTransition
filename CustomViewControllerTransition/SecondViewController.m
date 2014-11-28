//
//  SecondViewController.m
//  CustomViewControllerTransition
//
//  Created by dql on 14/11/26.
//  Copyright (c) 2014年 dql. All rights reserved.
//

#import "SecondViewController.h"
#import <UIKit/UIKit.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage * image = [UIImage imageNamed:@"1.jpg"];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 400, 100, 40);
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismissBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)dismissBtnClicked:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
