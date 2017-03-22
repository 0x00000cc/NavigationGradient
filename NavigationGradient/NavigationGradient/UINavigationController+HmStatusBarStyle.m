//
//  UINavigationController+HmStatusBarStyle.m
//  NavigationGradient
//
//  Created by 侯猛 on 2017/2/4.
//  Copyright © 2017年 侯猛. All rights reserved.
//

#import "UINavigationController+HmStatusBarStyle.h"

@implementation UINavigationController (HmStatusBarStyle)

- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.visibleViewController;
}
- (UIViewController *)childViewControllerForStatusBarHidden{
    return self.visibleViewController;
}

@end
