//
//  EnjoyTableViewController.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/4.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "EnjoyTableViewController.h"
#import "MJRefresh.h"
#import "NetWorkInterfaceBlock.h"
#import "EnjoyCell.h"
#import "EnjoyModel.h"
#import "EnjoyViewController.h"

@interface EnjoyTableViewController ()

@end

@implementation EnjoyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"如何欣赏诗词";
    [self.tableView registerClass:[EnjoyCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //打开即加载
    [self loadNewData];
    
    //自动进入刷新状态
    [self.tableView.header beginRefreshing];
    
    //加载下拉刷新
    __block EnjoyTableViewController * weakBlock = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        //数据加载完成
        [weakBlock loadNewData];
        //加载完成,结束刷新
        [weakBlock.tableView.header endRefreshing];
    }];
    
    //加载上拉加载
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        [weakBlock loadMoreData];
        [weakBlock.tableView.footer endRefreshing];
        [weakBlock.tableView.footer hasAmbiguousLayout];
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
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}
- (void)loadDataWithPage:(NSInteger)pageNumber{
    
    NetWorkInterfaceBlock * netWork = [[NetWorkInterfaceBlock alloc] initWithSuccessful:^(NSDictionary * dic) {
        NSArray * rowsArray = [dic objectForKey:@"rows"];
        for (NSDictionary * dict in rowsArray) {
             EnjoyModel * enjoy = [[EnjoyModel alloc] initWithDictionary:dict];
            [self.dataArray addObject:enjoy];
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
    
    EnjoyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (self.dataArray.count > 0) {
        cell.titleLable.text = ((EnjoyModel *)(self.dataArray[indexPath.row])).Question;
        cell.subheadLable.text = ((EnjoyModel *)(self.dataArray[indexPath.row])).Author;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EnjoyViewController * enjoyVC = [[EnjoyViewController alloc] init];
    enjoyVC.enjoyModel = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:enjoyVC animated:YES];

}


@end
