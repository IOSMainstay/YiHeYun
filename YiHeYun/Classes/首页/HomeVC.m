//
//  HomeVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "HomeVC.h"
#import "UIImage+GradientColor.h"
#import "ZBPieView.h"

@interface HomeVC ()
{
    ZBPieView *_runPieView;
    ZBPieView *_heartPieView;
    UILabel *_runTimeLab;
    UILabel *_heartTimeLab;
    UILabel *_runPercentLab;
    UILabel *_heartPercentLab;
    UILabel *_runStepLab;
    UILabel *_runKmLab;
}
@end

@implementation HomeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navBar.hidden = YES;
    //隐藏系统导航条
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //显示系统导航条
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    
    [self initView];
}

- (void)initView {
    
    __scrollView.contentSize = CGSizeMake(WIDTH, HEIGHT+1);
    
    UIColor *topleftColor = [UIColor colorWithRed:0.337 green:0.306 blue:0.373 alpha:1.000];
    UIColor *bottomrightColor = [UIColor colorWithRed:0.228 green:0.117 blue:0.322 alpha:1.000];
    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topleftColor, bottomrightColor] gradientType:GradientTypeUpleftToLowright imgSize:_headerView.size];
    _headerView.backgroundColor = [UIColor colorWithPatternImage:bgImg];
    
    //姓名、会员级别
    NSString *nameStr = @"谢霆锋";
    NSString *memberLevel = @"（普通会员）";
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",nameStr,memberLevel]];
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(nameStr.length, memberLevel.length)];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.624 green:0.608 blue:0.651 alpha:1.000] range:NSMakeRange(nameStr.length, memberLevel.length)];
    _titleLab.attributedText = attributedStr;
    
    //跑步信息
    _runPieView = [[ZBPieView alloc] initWithFrame:CGRectMake((WIDTH-180)/3-5, 90, 90, 90) andPercent:0.8 andColor:[UIColor colorWithRed:0.298 green:0.706 blue:0.663 alpha:1.000]];
    [_headerView addSubview:_runPieView];
    
    _runPercentLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, _runPieView.width, 15)];
    _runPercentLab.text = @"完成80%";
    _runPercentLab.font = [UIFont boldSystemFontOfSize:12];
    _runPercentLab.textColor = [UIColor colorWithRed:0.663 green:0.639 blue:0.714 alpha:1.000];
    _runPercentLab.textAlignment = NSTextAlignmentCenter;
    [_runPieView addSubview:_runPercentLab];
    
    _runStepLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 38, _runPieView.width, 20)];
    _runStepLab.font = [UIFont boldSystemFontOfSize:17];
    _runStepLab.textColor = [UIColor whiteColor];
    _runStepLab.textAlignment = NSTextAlignmentCenter;
    [_runPieView addSubview:_runStepLab];
    NSString *stepStr = @"7888";
    NSMutableAttributedString *stepAttrStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@步",stepStr]];
    [stepAttrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:9] range:NSMakeRange(stepStr.length, 1)];
    _runStepLab.attributedText = stepAttrStr;
    
    _runKmLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, _runPieView.width, 15)];
    _runKmLab.text = @"2.4km";
    _runKmLab.font = [UIFont boldSystemFontOfSize:10];
    _runKmLab.textColor = [UIColor whiteColor];
    _runKmLab.textAlignment = NSTextAlignmentCenter;
    [_runPieView addSubview:_runKmLab];
    
    //心率信息
    _heartPieView = [[ZBPieView alloc] initWithFrame:CGRectMake((WIDTH-180)/3*2+90+5, 90, 90, 90) andPercent:0.85 andColor:[UIColor colorWithRed:0.969 green:0.082 blue:0.353 alpha:1.000]];
    [_headerView addSubview:_heartPieView];
    
    _heartPercentLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 35, _heartPieView.width, 20)];
    _heartPercentLab.font = [UIFont boldSystemFontOfSize:17];
    _heartPercentLab.textColor = [UIColor whiteColor];
    _heartPercentLab.textAlignment = NSTextAlignmentCenter;
    [_heartPieView addSubview:_heartPercentLab];
    NSString *heartStr = @"85";
    NSMutableAttributedString *heartAttrStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@bmp",heartStr]];
    [heartAttrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:NSMakeRange(heartStr.length, 3)];
    _heartPercentLab.attributedText = heartAttrStr;
    
    _runTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(0, _runPieView.maxY+20, WIDTH/2, 20)];
    _runTimeLab.textAlignment = NSTextAlignmentCenter;
    _runTimeLab.font = [UIFont systemFontOfSize:11];
    _runTimeLab.textColor = [UIColor colorWithRed:0.620 green:0.600 blue:0.659 alpha:1.000];
    _runTimeLab.text = @"更新于2016-3-28  23:00";
    [_headerView addSubview:_runTimeLab];
    
    _heartTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2, _runPieView.maxY+20, WIDTH/2, 20)];
    _heartTimeLab.textAlignment = NSTextAlignmentCenter;
    _heartTimeLab.font = [UIFont systemFontOfSize:11];
    _heartTimeLab.textColor = [UIColor colorWithRed:0.620 green:0.600 blue:0.659 alpha:1.000];
    _heartTimeLab.text = @"更新于2016-3-28  23:00";
    [_headerView addSubview:_heartTimeLab];

}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
