//
//  PublicTableViewController.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/3.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "PublicTableViewController.h"
#import "PublicCell.h"
#import "MJRefresh.h"
#import "NetWorkInterfaceBlock.h"
#import "PublicModel.h"
#import "MinuteViewController.h"

@interface PublicTableViewController ()

@end

@implementation PublicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    self.view.backgroundColor = [UIColor blackColor];
    
    [self.tableView registerClass:[PublicCell class]forCellReuseIdentifier:@"cell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    self.pageNum = 0;
    //打开即加载
    [self loadNewData];

    //自动进入刷新状态
    [self.tableView.header beginRefreshing];
    
    //加载下拉刷新
    __block PublicTableViewController * weakSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    //加载上拉加载
    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
#pragma mark - Table View Rereshing Method
//下拉刷新
- (void)loadNewData{
    self.pageNum = 0;
    [self.dataArray removeAllObjects];
    [self loadDataWithPage:self.pageNum];
    [self.tableView.header endRefreshing];
}

- (void)loadMoreData{
    [self loadDataWithPage:++self.pageNum];
}

- (void)loadDataWithPage:(NSInteger)pageNumber{
    
    NetWorkInterfaceBlock * netWork = [[NetWorkInterfaceBlock alloc] initWithSuccessful:^(NSDictionary * dic) {
        [self.tableView.footer endRefreshing];
        NSArray * rowsArray = [dic objectForKey:@"rows"];
        for (NSDictionary * dict in rowsArray) {
            PublicModel * public = [[PublicModel alloc] initWithDictionary:dict];
            [self.dataArray addObject:public];
        }
        //刷新当前页面
        [self.tableView reloadData];
        if (self.dataArray.count == [dic[@"total"] intValue]) {
            [self.tableView removeFooter];
        }
        
    } fail:^BOOL(NSError *error) {
        return YES;
    }];
    NSString * str = [self.URLString stringByReplacingOccurrencesOfString:@"pageIndex=0" withString:@"pageIndex=%ld"];
    NSString * urlStr = [NSString stringWithFormat:str, pageNumber];
    [netWork get:urlStr];    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PublicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //设置cell样式
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    if (self.dataArray.count > 0) {
        cell.titleLable.text = ((PublicModel *)(self.dataArray[indexPath.row])).RhyHead;
        cell.subheadLable.text = ((PublicModel *)(self.dataArray[indexPath.row])).RhyMother;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MinuteViewController * minuteVC = [[MinuteViewController alloc] init];
    minuteVC.publicModel = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:minuteVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}

@end
