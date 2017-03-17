//
//  HomeVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation HomeVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatView];
}

- (void)creatView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-50) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH/1.35)];
    headerView.backgroundColor = [UIColor colorWithRed:61/255.0 green:50/255.0 blue:76/255.0 alpha:1];
    tableView.tableHeaderView = headerView;
    
    UIImageView *mineImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 30, 40, 40)];
    mineImage.layer.cornerRadius = 20;
    mineImage.layer.masksToBounds = YES;
    mineImage.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:mineImage];
    
    UIButton *pullDownBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(mineImage.frame)+10, 42, 16, 16)];
    [pullDownBtn setBackgroundImage:[UIImage imageNamed:@"下箭头"] forState:UIControlStateNormal];
    [headerView addSubview:pullDownBtn];
    
    UILabel *mineNameLab = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH-60)/2, 40, 60, 20)];
    mineNameLab.text = @"谢霆锋";
    mineNameLab.textColor = [UIColor whiteColor];
    mineNameLab.textAlignment = NSTextAlignmentCenter;
    mineNameLab.font = [UIFont systemFontOfSize:18];
    [headerView addSubview:mineNameLab];
    
    UILabel *vipStateLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(mineNameLab.frame), 47, 120, 12)];
    vipStateLab.text = @"（普通会员）";
    vipStateLab.textColor = [UIColor lightGrayColor];
    vipStateLab.font = [UIFont systemFontOfSize:10];
    [headerView addSubview:vipStateLab];
    
    UIButton *notificationBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-40, 40, 20, 20)];
    [notificationBtn setBackgroundImage:[UIImage imageNamed:@"通知"] forState:UIControlStateNormal];
    [headerView addSubview:notificationBtn];
    
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =nil;
    static NSString *identifer = @"cell";
    cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (! cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.section==0&&indexPath.row==0) {
        
        for(int i=0; i<2; i++) {
            for(int j=0; j<4; j++) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                btn.frame = CGRectMake(WIDTH/4*j, WIDTH/4*i, WIDTH/4, WIDTH/4);
                [btn setTitle:[NSString stringWithFormat:@"%d",(3*i+j)+1] forState:0];
                [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"home0%d",(3*i+j)]] forState:UIControlStateNormal];
                btn.tag = 4*i+j;
                [cell.contentView addSubview:btn];
            }
        }
        
    } else if (indexPath.section==1&&indexPath.row==0) {
        
        
    } else if (indexPath.section==1&&indexPath.row==1) {
        
        
    } else {
        
        
        
    }
    
    return cell;
}

#pragma mark -UITableViewDelegate
//组头部的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    } else if (section == 1) {
        return 20;
    } else{
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0&&indexPath.row == 0) {
        return WIDTH/2;
    } else if (indexPath.section == 1&&indexPath.row == 0){
        return 60;
    }
    
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            
        } else if (indexPath.row == 1) {
            
        } else {
            
        }
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                
                break;
                
            default:
                break;
        }
    }
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
