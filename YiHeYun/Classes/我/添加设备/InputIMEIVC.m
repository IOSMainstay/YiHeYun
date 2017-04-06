//
//  InputIMEIVC.m
//  YiHeYun
//
//  Created by zhanbing han on 17/4/6.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "InputIMEIVC.h"

@interface InputIMEIVC ()
{
    UITextField *imeTF;
    UIButton *bindBtn;
}
@end

@implementation InputIMEIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"输入IME码";
    
    [self initView];
}

- (void)initView {
    
    imeTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 84, WIDTH, 44)];
    imeTF.text = @"865946020912422";
    imeTF.backgroundColor = [UIColor whiteColor];
    imeTF.placeholder = @"输入IME码";
    imeTF.font = [UIFont systemFontOfSize:14];
    imeTF.textColor = [UIColor darkGrayColor];
    [self.view addSubview:imeTF];
    
    CGRect frame = [imeTF frame];  //为你定义的UITextField
    frame.size.width = 16;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    imeTF.leftViewMode = UITextFieldViewModeAlways;  //左边距为15pix
    imeTF.leftView = leftview;
    
    bindBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, imeTF.maxY+30, WIDTH, 44)];
    bindBtn.backgroundColor = AppThemeColor;
    [bindBtn setTitle:@"绑定" forState:UIControlStateNormal];
    [bindBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bindBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bindBtn addTarget:self action:@selector(bindAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bindBtn];
}

//绑定智能手环
- (void)bindAction {
    
    if ([Utils isBlankString:imeTF.text]) {
        [Utils showToast:@"请输入IME码"];
        return;
    }
    
    [JHHJView showLoadingOnTheKeyWindowWithType:JHHJViewTypeSingleLine]; //开始加载
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
                         [UserInfo share].memberId, @"memberId",
                         imeTF.text, @"terminalId",
                         @"1001", @"deviceId",
                         nil];
    [[NetworkManager sharedManager] postJSON:URL_BindOrUnBindDevice parameters:dic imagePath:nil completion:^(id responseData, RequestState status, NSError *error) {
        
        [JHHJView hideLoading]; //结束加载
        
        if (status == Request_Success) {
            [Utils showToast:@"绑定成功"];
            
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            [Utils showToast:@"绑定失败"];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
