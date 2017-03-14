//
//  FindVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "FindVC.h"

@implementation FindCell

-(void)awakeFromNib{
    [super awakeFromNib];
    _cellBgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _cellBgView.layer.borderWidth = 0.5;
}

@end

@interface FindVC ()

@end

@implementation FindVC

- (void)viewDidLoad {
    [super viewDidLoad];

self.title = @"发现";
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,  WIDTH/2.0+20)];
    _topBannerView.frame = CGRectMake(15, 10, WIDTH-30, WIDTH/2.0);
    _topBannerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [bgView addSubview:_topBannerView];
    _topBannerView.imageURLStringsGroup = @[@"http://pic.58pic.com/58pic/14/15/82/29S58PICTPg_1024.jpg",@"http://pic27.nipic.com/20130319/11935511_225831392000_2.jpg"];
    _topBannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _findTabView.tableHeaderView = bgView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FindCell *cell = [tableView dequeueReusableCellWithIdentifier:@"findCell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 40)];
    UILabel *ll = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, WIDTH-30, 20)];
    ll.textColor = [UIColor darkGrayColor];
    ll.text = @"活动";
    ll.font = [UIFont systemFontOfSize:14];
    [view addSubview:ll];

    return view;
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
