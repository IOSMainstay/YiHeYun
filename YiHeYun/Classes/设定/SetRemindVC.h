//
//  SetRemindVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/10.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface SetRemindVC : BaseVC
@property (weak, nonatomic) IBOutlet UITextField *remindTitleTF;
- (IBAction)handClocksTouchAction:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UILabel *remindTimeLB;
- (IBAction)setRemindTimeAction:(id)sender;
- (IBAction)setRecordAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *showRecordLB;
- (IBAction)saveDataAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *deleteRecordBtn;
- (IBAction)deleteRecordAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *recordBtn;

@end
