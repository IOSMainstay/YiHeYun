//
//  SetRemindVC.m
//  YiHeYun
//
//  Created by mac on 2017/3/10.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "SetRemindVC.h"
#import "SelectDateView.h"
#import "LVRecordTool.h"

#define RecordImage  [UIImage imageNamed:@"laba"]

@interface SetRemindVC ()<LVRecordToolDelegate>
{
    SelectDateView *slectDateView;
    UIButton *bgButton;
    UIView *recordView;
    UILabel *timeLB;
    int recordTime;

}
@property (nonatomic, strong) LVRecordTool *recordTool;
@end

@implementation SetRemindVC

- (void)recordTool:(LVRecordTool *)recordTool didstartRecoring:(int)no andTime:(NSInteger)time{
   timeLB.text = [NSString stringWithFormat:@"- %ds -",(int)recordTool.recorder.currentTime];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置提醒";
    [self initViews];
}


- (void)initViews{

    _remindTitleTF.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _remindTitleTF.layer.borderWidth = 1;
    //    _remindTitleTF.leftView = bg;
    _remindTitleTF.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
    //设置显示模式为永远显示(默认不显示)
    _remindTitleTF.leftViewMode = UITextFieldViewModeAlways;


    bgButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    bgButton.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
    [bgButton addTarget:self action:@selector(hiddenAllView) forControlEvents:UIControlEventTouchUpInside];
    bgButton.alpha = 0.0;
    bgButton.hidden = YES;
    [self.view addSubview:bgButton];

    __weak SetRemindVC *weakSelf = self;
    slectDateView = [[SelectDateView alloc]initWithFrame:CGRectMake(15, HEIGHT, WIDTH-30, 250)];

    slectDateView.getSlectDate = ^(NSString *date){
        weakSelf.remindTimeLB.text = date;

    };
    slectDateView.cancleSelect = ^(){
        [weakSelf hiddenAllView];
    };
    [self.view addSubview:slectDateView];


    recordView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT, WIDTH, 200)];
    recordView.backgroundColor = [UIColor whiteColor];
    [bgButton addSubview:recordView];

    timeLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, WIDTH, 30)];
    timeLB.textAlignment = NSTextAlignmentCenter;
    timeLB.text = @"按住开始，松开结束";
    timeLB.font = [UIFont systemFontOfSize:14];
    timeLB.textColor = [UIColor darkGrayColor];
    [recordView addSubview:timeLB];

    UIButton *touchBtn = [[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50, 80, 80)];
    touchBtn.cornerRadius = 40;
    touchBtn.backgroundColor = [UIColor lightGrayColor];
    [touchBtn setImage:[UIImage imageNamed:@"record"] forState:0];
    [recordView addSubview:touchBtn];
    [touchBtn addTarget:self action:@selector(recordBtnDidTouchDown:) forControlEvents:UIControlEventTouchDown];
    [touchBtn addTarget:self action:@selector(recordBtnDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [touchBtn addTarget:self action:@selector(recordBtnDidTouchDragExit:) forControlEvents:UIControlEventTouchDragExit];


    _recordTool  = [LVRecordTool sharedRecordTool];
    _recordTool.delegate = self;



}

// 按下
- (void)recordBtnDidTouchDown:(UIButton *)recordBtn {
    [self.recordTool startRecording];

}
// 点击
- (void)recordBtnDidTouchUpInside:(UIButton *)recordBtn {

        int currentTime = self.recordTool.recorder.currentTime;
        if (currentTime < 1) {

            //        self.imageView.image = [UIImage imageNamed:@"mic_0"];
                    [Utils showToast:@"说话时间太短"];
            dispatch_async(dispatch_get_global_queue(0, 0), ^{

                [self.recordTool stopRecording];
                [self.recordTool destructionRecordingFile];
            });
        } else {


            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

                [self.recordTool stopRecording];

                [self.recordBtn setImage:RecordImage forState:0];
                self.deleteRecordBtn.hidden = NO;
                NSString *timee ;
                if (currentTime<60) {
                    timee = [NSString stringWithFormat:@" %d秒",currentTime];
                }else if(currentTime<3600){
                    timee = [NSString stringWithFormat:@" %d分%d秒",currentTime/60,currentTime*60];
                }else{
                    //                timee = [NSString stringWithFormat:@" %d分%d秒",currentTime/60,currentTime*60];
                }
                [self.recordBtn setTitle:timee forState:0];

            });

            //        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            //
            
            //            dispatch_async(dispatch_get_main_queue(), ^{
            //                self.imageView.image = [UIImage imageNamed:@"mic_0"];
            //            });
            //        });
            // 已成功录音
            NSLog(@"已成功录音");
            [self hiddenAllView];
        }



}

// 手指从按钮上移除
- (void)recordBtnDidTouchDragExit:(UIButton *)recordBtn {
//    self.imageView.image = [UIImage imageNamed:@"mic_0"];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
         [self hiddenAllView];
        [self.recordTool stopRecording];
        [self.recordTool destructionRecordingFile];

        dispatch_async(dispatch_get_main_queue(), ^{
//            [self alertWithMessage:@"已取消录音"];
        });
    });

}

- (void)hiddenAllView{
    [UIView animateWithDuration:0.2 animations:^{
        recordView.y = HEIGHT;
        slectDateView.y = HEIGHT;
        bgButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        bgButton.hidden = YES;;
        recordView.hidden = YES;
        slectDateView.hidden = YES;

        //        selectTimeView.hidden = YES;
    }];
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

- (IBAction)handClocksTouchAction:(UISwitch *)sender {
}
- (IBAction)setRemindTimeAction:(id)sender {
    [self.view endEditing:YES];
    slectDateView.hidden = NO;
    bgButton.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        slectDateView.y = HEIGHT/2-slectDateView.frame.size.height/2.0;
        bgButton.alpha = 1.0;
    } completion:^(BOOL finished) {

    }];
}

- (IBAction)setRecordAction:(id)sender {
     [self.view endEditing:YES];
    if (self.deleteRecordBtn.hidden) {//录音
        recordView.hidden = NO;
        bgButton.hidden = NO;
        [UIView animateWithDuration:0.2 animations:^{
            recordView.y = HEIGHT-recordView.frame.size.height-64;
            bgButton.alpha = 1.0;
        } completion:^(BOOL finished) {
            
        }];
    }else{
        [self.recordTool playRecordingFile];
    }


}
- (IBAction)saveDataAction:(id)sender {
}
- (IBAction)deleteRecordAction:(id)sender {
     [self.view endEditing:YES];
    [self.recordTool destructionRecordingFile];
    [_recordBtn setTitle:@"未录制，点击录制" forState:0];
     [self.recordBtn setImage:nil forState:0];
    _deleteRecordBtn.hidden = YES;
    
}
@end
