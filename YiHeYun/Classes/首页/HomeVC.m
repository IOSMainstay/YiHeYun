//
//  HomeVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "HomeVC.h"
#import "UIImage+GradientColor.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initView];
}

- (void)initView {
    
    UIColor *topleftColor = [UIColor colorWithRed:48/255.0f green:127/255.0f blue:202/255.0f alpha:1.0f];
    UIColor *bottomrightColor = [UIColor colorWithRed:35/255.0f green:195/255.0f blue:95/255.0f alpha:1.0f];
    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topleftColor, bottomrightColor] gradientType:GradientTypeUpleftToLowright imgSize:_headerView.size];
    _headerView.backgroundColor = [UIColor colorWithPatternImage:bgImg];
}

 #pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    UIViewController *vc = segue.destinationViewController;
//    vc.hidesBottomBarWhenPushed = YES;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
