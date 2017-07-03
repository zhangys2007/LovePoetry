//
//  CharmTableViewController.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/3.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "CharmTableViewController.h"
#import "CharmCell.h"
#import "PublicTableViewController.h"
#import "PublicDefine.h"

@interface CharmTableViewController ()

@end

@implementation CharmTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"韵字查询";
    //重写cell

    [self.tableView registerClass:[CharmCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CharmCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSArray * imageArray = @[@"icop01", @"icon02", @"icon03"];
    cell.titleImageView.image = [UIImage imageNamed:imageArray[indexPath.row]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_AUTO_SIZE 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PublicTableViewController * publicVC = [[PublicTableViewController alloc] init];
    publicVC.URLString = [NSString stringWithFormat:@"http://www.wongsimon.com:8888/ipoem/poemhandler?lcode=zh-Hans&version=2.0&method=rhymequery&type=%ld&key=&pageSize=20&pageIndex=0", (long)indexPath.row + 1];
    [self.navigationController pushViewController:publicVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}


@end
