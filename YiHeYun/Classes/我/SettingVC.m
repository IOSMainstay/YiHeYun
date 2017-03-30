//
//  SettingVC.m
//  YiHeYun
//
//  Created by Ink on 2017/3/28.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "SettingVC.h"
#import "SetPswVC.h"

@interface SettingVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation SettingVC

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"设置";

  [self creatTableView];
}

- (void)creatTableView
{
  UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
  tableView.dataSource = self;
  tableView.delegate = self;
  tableView.backgroundColor = [UIColor clearColor];
  [self.view addSubview:tableView];

  UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 100)];
  footerView.backgroundColor = [UIColor clearColor];
  tableView.tableFooterView = footerView;

  UIButton *logoutButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 50, WIDTH, 50)];
  [logoutButton setTitle:@"退出" forState:UIControlStateNormal];
  [logoutButton addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
  [logoutButton setBackgroundColor:AEColor(126, 53, 150, 1)];
  [footerView addSubview:logoutButton];
}

-(void)logoutAction {
  // @TODO: <# describe #>

}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell =nil;
  static NSString *identifer = @"cell";
  cell = [tableView dequeueReusableCellWithIdentifier:identifer];
  UIStackView *imageStackView ;
  if (! cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifer];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }

  cell.textLabel.font = [UIFont systemFontOfSize:15];
  cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
  cell.detailTextLabel.text = self.dataSource[indexPath.row][@"message"];

  imageStackView = nil;
  if ( indexPath.row == 3 ) {
    imageStackView = [[UIStackView alloc] init];
    [cell addSubview:imageStackView];
    [imageStackView alignTrailingEdgeWithView:cell predicate:@"-35"];
    [imageStackView alignCenterYWithView:cell predicate:@"0"];
    [imageStackView setAxis:UILayoutConstraintAxisHorizontal];
    [imageStackView setSpacing:10];

    NSArray *imageNames = self.dataSource[indexPath.row][@"imageNames"];
    for (int index = 0; index <= 1; index++) {
      UIImageView *iconImage = [[UIImageView alloc]init];
      [iconImage setContentMode:UIViewContentModeScaleAspectFit];
      [iconImage constrainWidth:@"40" height:@"40"];
      iconImage.image = [UIImage imageNamed:imageNames[index]];
      [imageStackView addArrangedSubview:iconImage];
    }
  }

  return cell;
}

#pragma mark -UITableViewDelegate
//组头部的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  switch (indexPath.row) {
    case 1:
      
      break;

    case 2: case 5:
      [self performSegueWithIdentifier:self.self.dataSource[indexPath.row][@"segue"] sender:nil];
      break;

    default:
      break;
  }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

  UIViewController *destinatVC = segue.destinationViewController;
  destinatVC.hidesBottomBarWhenPushed = true;
  destinatVC.navigationController.navigationBar.hidden = false;
}

-(NSArray *) dataSource {
  if (!_dataSource) {
    NSString *versionStr = [NSString stringWithFormat:@"云健康V%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    NSString *telNumber = @"18888888888";

    NSString *telStr = [telNumber stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    _dataSource = @[@{@"title":@"登录手机",@"message":telStr,    @"segue":@""},
                    @{@"title":@"修改密码",@"message":@"",       @"segue":@""},
                    @{@"title":@"关于我们",@"message":@"",       @"segue":@"aboutUsSegue"},
                    @{@"title":@"分享",   @"message":@"",       @"imageNames":@[@"test_pengyouquan",@"test_pengyouquan"]},
                    @{@"title":@"检查更新",@"message":versionStr,@"segue":@""},
                    @{@"title":@"使用帮助",@"message":@"",       @"segue":@"helpSegue"},];
  }
  return _dataSource;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
