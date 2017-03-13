//
//  SelectDateView.h
//  PlayerVideoDemo
//
//  Created by mac on 2017/3/13.
//  Copyright © 2017年 zrgg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectDateView : UIView

@property (nonatomic , copy)NSString *title;

@property (nonatomic , copy)void (^getSlectDate)(NSString *dateStr);
@property (nonatomic , copy)void (^cancleSelect)();
@end
