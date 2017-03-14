//
//  AddUrgentVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/14.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface AddUrgentVC : BaseVC
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
- (IBAction)selectRalationAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *relationLB;
@property (weak, nonatomic) IBOutlet UITextField *phoneLB;

@end
