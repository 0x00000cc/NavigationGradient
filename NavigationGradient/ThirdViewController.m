//
//  ThirdViewController.m
//  NavigationGradient
//
//  Created by 侯猛 on 2017/2/6.
//  Copyright © 2017年 侯猛. All rights reserved.
//

#import "ThirdViewController.h"
#import "ViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"transparent";
    // 导航栏透明度
    self.navAlpha = 0.0f;
    // 隐藏导航栏
    //    self.navHidden = true;
    UIButton *button =[[UIButton alloc] initWithFrame:CGRectMake(0,0, 50, 50)];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.center = self.view.center;
    [self.view addSubview:button];
}

- (void)clickButton:(UIButton *)sender
{
    [self.navigationController pushViewController:[ViewController new] animated:true];
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
