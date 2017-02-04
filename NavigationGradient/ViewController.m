//
//  ViewController.m
//  NavigationGradient
//
//  Created by 侯猛 on 2017/2/4.
//  Copyright © 2017年 侯猛. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationFade;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"white";
    UIButton *button =[[UIButton alloc] initWithFrame:CGRectMake(0,0, 50, 50)];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.center = self.view.center;
    [self.view addSubview:button];
}

- (void)clickButton:(UIButton *)sender
{
    [self.navigationController pushViewController:[FirstViewController new] animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
