//
//  FirstViewController.m
//  NavigationGradient
//
//  Created by 侯猛 on 2017/2/4.
//  Copyright © 2017年 侯猛. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationFade;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"red";
    self.navigationBarColor = [UIColor redColor];
    UIButton *button =[[UIButton alloc] initWithFrame:CGRectMake(0,0, 50, 50)];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.center = self.view.center;
    [self.view addSubview:button];
}

- (void)clickButton:(UIButton *)sender
{
    [self.navigationController pushViewController:[SecondViewController new] animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
