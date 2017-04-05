//
//  LiveHabitVC.m
//  YiHeYun
//
//  Created by Ink on 2017/4/5.
//  Copyright © 2017年 yhy. All rights reserved.
//

#import "LiveHabitVC.h"

@interface LiveHabitVC ()

@end

@implementation LiveHabitVC

- (void)viewDidLoad {
  [super viewDidLoad];

  CGFloat frameY = 0.0f;
  if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
    self.edgesForExtendedLayout =  UIRectEdgeNone;
    frameY = 64.0f;
  } else {
    frameY = 44.0f;
  }

//  self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f,self.view.frame.size.width,self.view.frame.size.height-frameY) style:UITableViewStylePlain];
//  self.tableView.tableFooterView = [[UIView alloc] init];
//  self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//  self.tableView.dataSource = self;
//  self.tableView.delegate = self;
//  [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
