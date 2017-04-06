//
//  AddDeviceVC.m
//  YiHeYun
//
//  Created by zhanbing han on 17/4/6.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "AddDeviceVC.h"
#import "AddSmartWatchVC.h"

@interface AddDeviceVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArr;
}
@end

@implementation AddDeviceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"添加设备";
    
    _dataArr = [NSMutableArray arrayWithObjects:@"智能手表",@"血压计",@"血糖计",@"体重计",@"体温计", nil];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 84, WIDTH, 220) style:UITableViewStylePlain];
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
    if ([titleStr isEqualToString:@"智能手表"]) {
        AddSmartWatchVC *vc = [[AddSmartWatchVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
