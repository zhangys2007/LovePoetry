//
//  QueryTableViewController.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/1.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "QueryTableViewController.h"
#import "QUeryViewCell.h"
#import "CharmTableViewController.h"
#import "PublicTableViewController.h"
#import "MetreTableViewController.h"
#import "LogiciansTableViewController.h"
#import "KonwledgeTableViewController.h"
#import "EnjoyTableViewController.h"
#import "PublicDefine.h"

@interface QueryTableViewController ()

@end

@implementation QueryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title= @"写作常识";

    //重写cell
    [self.tableView registerClass:[QUeryViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QUeryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray * imageArray = @[@"icon_1", @"icon_2", @"icon_3" , @"icon_4", @"icon_5"];

    cell.titleImageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NSArray * urlArray = @[@"melodylist", @"authorlist", @"faqlist", @"articlelist"];
    if (indexPath.row == 0) {
        CharmTableViewController * charmVC = [[CharmTableViewController alloc] init];
        [self.navigationController pushViewController:charmVC animated:YES];
    }else if (indexPath.row == 1){
        MetreTableViewController  * metreVC = [[MetreTableViewController                    alloc] init];
        metreVC.URLString = @"http://www.wongsimon.com:8888/ipoem/poemhandler?lcode=zh-Hans&version=2.0&method=melodylist&pageSize=20&key=&pageIndex=0";
        [self.navigationController pushViewController:metreVC animated:YES];
    }else if (indexPath.row == 2){
        LogiciansTableViewController  * metreVC = [[LogiciansTableViewController                    alloc] init];
        metreVC.URLString = @"http://www.wongsimon.com:8888/ipoem/poemhandler?lcode=zh-Hans&version=2.0&method=authorlist&pageSize=20&key=&pageIndex=0";
        [self.navigationController pushViewController:metreVC animated:YES];
    }else if (indexPath.row == 3){
        KonwledgeTableViewController  * metreVC = [[KonwledgeTableViewController                    alloc] init];
        metreVC.URLString = @"http://www.wongsimon.com:8888/ipoem/poemhandler?lcode=zh-Hans&version=2.0&method=faqlist&pageSize=20&key=&pageIndex=0";
        [self.navigationController pushViewController:metreVC animated:YES];
    }else if (indexPath.row == 4){
        EnjoyTableViewController  * metreVC = [[EnjoyTableViewController                    alloc] init];
        metreVC.URLString = @"http://www.wongsimon.com:8888/ipoem/poemhandler?lcode=zh-Hans&version=2.0&method=articlelist&pageSize=20&key=&pageIndex=0";
        [self.navigationController pushViewController:metreVC animated:YES];
    }
}



#pragma mark UITableViewDelagate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_AUTO_SIZE 320, SCREEN_AUTO_SIZE 130)];
    imageView.image = [UIImage imageNamed:@"nous_top"];
    return imageView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return SCREEN_AUTO_SIZE 130;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return SCREEN_AUTO_SIZE 65;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}


@end
