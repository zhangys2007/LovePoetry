//
//  LogiciansTableViewController.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/4.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "LogiciansTableViewController.h"
#import "MJRefresh.h"
#import "NetWorkInterfaceBlock.h"
#import "LogiciansCell.h"
#import "LogiciansModel.h"
#import "PoetTableViewController.h"

@interface LogiciansTableViewController ()

@end

@implementation LogiciansTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"名家专辑";
    
    [self.tableView registerClass:[LogiciansCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //打开即加载
    [self loadNewData];
    
    //自动进入刷新状态
    [self.tableView.header beginRefreshing];
    
    //加载下拉刷新
    __block LogiciansTableViewController * weakself = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        //数据加载完成
        [weakself loadNewData];
        //加载完成,结束刷新
        [weakself.tableView.header endRefreshing];
    }];
    
    //加载上拉加载
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [weakself loadMoreData];
        [weakself.tableView.footer endRefreshing];
    }];
    
}
#pragma mark - Table View Rereshing Method
//下拉刷新
- (void)loadNewData{
    self.pageNum = 0;
    self.dataArray = nil;
    [self loadDataWithPage:self.pageNum];
}

- (void)loadMoreData{
    [self loadDataWithPage:++self.pageNum];
}

- (void)loadDataWithPage:(NSInteger)pageNumber{
    
    NetWorkInterfaceBlock * netWork = [[NetWorkInterfaceBlock alloc] initWithSuccessful:^(NSDictionary * dic) {
        NSArray * rowsArray = [dic objectForKey:@"rows"];
        for (NSDictionary * dict in rowsArray) {
            LogiciansModel * meter = [[LogiciansModel alloc] initWithDictionary:dict];
            [self.dataArray addObject:meter];
            
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

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LogiciansCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (self.dataArray.count > 0) {
        cell.titleLable.text = ((LogiciansModel *)(self.dataArray[indexPath.row])).AuthorName;
        cell.subheadLable.text = [NSString stringWithFormat:@"共收录%@首", ((LogiciansModel *)(self.dataArray[indexPath.row])).PoemCount];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PoetTableViewController * poteTVC = [[PoetTableViewController alloc] init];
    poteTVC.authorid = ((LogiciansModel *)(self.dataArray[indexPath.row])).AuthorID;
    poteTVC.authorName = ((LogiciansModel *)(self.dataArray[indexPath.row])).AuthorName;
    [self.navigationController pushViewController:poteTVC animated:YES];
}

@end
