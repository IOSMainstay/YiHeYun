//
//  AddSmartWatchVC.m
//  YiHeYun
//
//  Created by zhanbing han on 17/4/6.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "AddSmartWatchVC.h"
#import "InputIMEIVC.h"
#import "ScanVC.h"

@interface AddSmartWatchVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArr;
}
@end

@implementation AddSmartWatchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"添加智能手表";
    
    _dataArr = [NSMutableArray arrayWithObjects:@"扫描二维码",@"输入IMEI", nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 84, WIDTH, 88) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableView 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = _dataArr[indexPath.row];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //取消选择状态
    
    NSString *titleStr = _dataArr[indexPath.row];
    if ([titleStr isEqualToString:@"扫描二维码"]) {
        ScanVC *vc = [[ScanVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([titleStr isEqualToString:@"输入IMEI"]) {
        InputIMEIVC *vc = [[InputIMEIVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
