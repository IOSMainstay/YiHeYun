//
//  AddUrgentVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/14.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "AddUrgentVC.h"
#import "ZSPickView.h"

@interface AddUrgentVC ()
{
     ZSPickView *stupView;
    UIButton *bgButton;
}
@end

@implementation AddUrgentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"家庭联系人";
    UIButton *addBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 44)];
    [addBtn setTitleColor:AppThemeColor forState:0];
    addBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    addBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [addBtn setTitle:@"保存" forState:0];
    [addBtn addTarget:self action:@selector(saveInfo) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithCustomView:addBtn];
    self.navItem.rightBarButtonItem = rightBarItem;


    __weak AddUrgentVC *weakSelf = self;


    bgButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    bgButton.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    [bgButton addTarget:self action:@selector(hiddenAllView) forControlEvents:UIControlEventTouchUpInside];
    bgButton.alpha = 0.0;
    bgButton.hidden = YES;
    [self.view addSubview:bgButton];

    stupView = [[ZSPickView alloc]initWithComponentArr:nil];
    stupView.y = HEIGHT;
    stupView.hidden = YES;
    stupView.title = @"关系";
    stupView.componentArr = @[@"父亲",@"母亲",@"儿子",@"女儿",@"闺蜜",@"朋友"];
    stupView.getCurrentIndex = ^(NSInteger index){
        weakSelf.relationLB.text = stupView.componentArr[index];
        [weakSelf hiddenAllView];
    };
    stupView.cancleBlock = ^(){
        //        [weakSelf hiddenAllView];
    };
    [self.view addSubview:stupView];

}



- (void)hiddenAllView{
    [UIView animateWithDuration:0.2 animations:^{
        stupView.y = HEIGHT;

        bgButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        bgButton.hidden = YES;;
        stupView.hidden = YES;

    }];
}


- (void)saveInfo{

    [self.navigationController popViewControllerAnimated:YES];
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

- (IBAction)selectRalationAction:(id)sender {
    bgButton.hidden = NO;;
    stupView.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        stupView.y = HEIGHT-stupView.height;

        bgButton.alpha = 1.0;
    } ];
}
@end
