//
//  BaseViewController.h
//  NavigationGradient
//
//  Created by 侯猛 on 2017/2/4.
//  Copyright © 2017年 侯猛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


/**
 导航栏颜色
 */
@property (nonatomic, strong)UIColor *navigationBarColor;

/**
 导航栏透明度
 */
@property (nonatomic, assign)CGFloat navAlpha;

@end
