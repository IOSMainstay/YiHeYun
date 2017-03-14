//
//  UrgentCallVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/14.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "UrgentCallVC.h"
#import "AddUrgentVC.h"

@implementation CallTabCell



@end

@interface UrgentCallVC ()
{
    UIView *tabView;
}
@end

@implementation UrgentCallVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    _callTableView.estimatedSectionFooterHeight = 200;
    tabView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 200)];
    tabView = _tabFootView;
    _tabFootView.height = 250;
    _callTableView.tableFooterView = _tabFootView;
    _callTableView.contentSize = CGSizeMake(0, 1000);
    self.title = @"紧急联系人";

    UIButton *addBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 44)];
    [addBtn setTitleColor:AppThemeColor forState:0];
    addBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    addBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [addBtn setTitle:@"添加" forState:0];
    [addBtn addTarget:self action:@selector(addCallUser) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithCustomView:addBtn];
    self.navItem.rightBarButtonItem = rightBarItem;
}

- (void)addCallUser{

    AddUrgentVC *vc = (AddUrgentVC *)[Utils getVCInBoard:@"Main" ID:@"AddUrgentVC"];
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CallTabCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"urgentCallCell"];

    return cell;
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
