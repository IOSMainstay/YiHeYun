//
//  UrgentCallVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/14.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"

@interface CallTabCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImgView;
@property (weak, nonatomic) IBOutlet UILabel *userPhoneLB;

@end

@interface UrgentCallVC : BaseVC<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *callTableView;
@property (weak, nonatomic) IBOutlet UIView *tabFootView;

@end
