//
//  FindVC.h
//  YiHeYun
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "BaseVC.h"
#import "SDCycleScrollView.h"

@interface FindCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImgView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLB;
@property (weak, nonatomic) IBOutlet UILabel *cellTimeLB;
@property (weak, nonatomic) IBOutlet UIView *cellBgView;

@end


@interface FindVC : BaseVC<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *topBannerView;
@property (weak, nonatomic) IBOutlet UITableView *findTabView;

@end
