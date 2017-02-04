//
//  BaseViewController.m
//  NavigationGradient
//
//  Created by 侯猛 on 2017/2/4.
//  Copyright © 2017年 侯猛. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.navigationController.navigationBar.barTintColor = self.navigationBarColor;
        UIImageView *imageView = self.navigationController.navigationBar.subviews.firstObject;
        imageView.alpha = self.navAlpha;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.navigationController.navigationBar.barTintColor = self.navigationBarColor;
        UIImageView *imageView = self.navigationController.navigationBar.subviews.firstObject;
        imageView.alpha = self.navAlpha;
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.navigationController.navigationBar.barTintColor = self.navigationBarColor;
        UIImageView *imageView = self.navigationController.navigationBar.subviews.firstObject;
        imageView.alpha = self.navAlpha;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.navigationController.navigationBar.barTintColor = self.navigationBarColor;
        UIImageView *imageView = self.navigationController.navigationBar.subviews.firstObject;
        imageView.alpha = self.navAlpha;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationBarColor = [UIColor whiteColor];
    self.navAlpha = 1.0f;
    
    if (self.navigationController.viewControllers.count != 1) {
        [self settingBackButton];
    }
}

- (void)settingBackButton
{
    UIImage* returnImage=[UIImage imageNamed:@"back"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 70, 44);
    [backButton setTitle:@"" forState:UIControlStateNormal];
    [backButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
    [backButton setImage:returnImage forState:UIControlStateNormal];
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(13.5, 0, 13.5, 60)];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [backButton addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backButtonItem;
    
}

- (void)gotoBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 解决一级页面响应滑动返回
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([gestureRecognizer isEqual:self.navigationController.interactivePopGestureRecognizer] && [self.navigationController.viewControllers count]==1) {
        return NO;
    } else {
        return YES;
    }
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
