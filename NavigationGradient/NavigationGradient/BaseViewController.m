//
//  BaseViewController.m
//  NavigationGradient
//
//  Created by 侯猛 on 2017/2/4.
//  Copyright © 2017年 侯猛. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic, strong)UIImageView *navBackImage;
@property (nonatomic, strong)UIImageView *navLineImage;
@end

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if (!self.navHidden) {
        // 当下级页面或者上级页面的导航栏没有隐藏的时候才改变颜色
        // 否则会有颜色突变的BUG
        [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            self.navigationController.navigationBar.barTintColor = self.navigationBarColor;
            // 获取导航栏背景图片 来设置透明度
            [self navBackImageAlpha:self.navAlpha];
            
        } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
            self.navigationController.navigationBar.barTintColor = self.navigationBarColor;
            [self navBackImageAlpha:self.navAlpha];
        }];
    }else
    {
        // 隐藏当前页面的导航栏
        [self.navigationController setNavigationBarHidden:true animated:animated];
        
        [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            // 获取导航栏背景图片 来设置透明度
            [self navBackImageAlpha:0.0f];
        } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            
            [self navBackImageAlpha:0.0f];
            
        }];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.navHidden) {
        // 显示当前页面的导航栏
        [self.navigationController setNavigationBarHidden:false animated:animated];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.navHidden || self.navAlpha == 0.0f) {
        // 视图已经出现的时候，如果导航栏是透明的或隐藏的，则把导航栏变成白色，防止切换的时候串色
        self.navigationBarColor = [UIColor whiteColor];
    }
}

- (void)navBackImageAlpha:(CGFloat)alpha
{
    // 导航栏背景透明度
    self.navBackImage.alpha = alpha;
    // 导航栏底部横线透明度
    self.navLineImage.alpha = alpha;
}

- (void)setNavFirstAlpha:(CGFloat)navFirstAlpha
{
    self.navAlpha = navFirstAlpha;
    // 导航栏背景透明度
    self.navBackImage.alpha = navFirstAlpha;
    // 导航栏底部横线透明度
    self.navLineImage.alpha = navFirstAlpha;
}

// 筛选出导航栏底部横线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0f) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBackImage = self.navigationController.navigationBar.subviews.firstObject;
    self.navLineImage = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    self.navHidden = self.navigationController.navigationBarHidden;
    self.navigationBarColor = [UIColor whiteColor];
    self.navAlpha = 1.0f;
    
    if (self.navigationController.viewControllers.count != 1.0f) {
        [self settingBackButton];
    }
}

- (void)setNavigationBarColor:(UIColor *)navigationBarColor
{
    _navigationBarColor = navigationBarColor;
    if (self.navigationController.viewControllers.count == 1.0f) {
        self.navigationController.navigationBar.barTintColor = self.navigationBarColor;
    }
}

- (void)settingBackButton
{
    UIImage *backImage   = [UIImage imageNamed:@"back"];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 70.0f, 44.0f)];
    [backButton setTitle:@"" forState:UIControlStateNormal];
    [backButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, -40.0f, 0.0f, 0.0f)];
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(13.5f, 0.0f, 13.5f, 60.0f)];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
    [backButton addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backButtonItem       = [[UIBarButtonItem alloc]initWithCustomView:backButton];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
