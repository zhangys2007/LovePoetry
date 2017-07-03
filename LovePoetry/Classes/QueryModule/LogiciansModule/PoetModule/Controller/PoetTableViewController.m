//
//  PoetTableViewController.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/7.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "PoetTableViewController.h"
#import "MJRefresh.h"
#import "NetWorkInterfaceBlock.h"
#import "PoetModel.h"
#import "PoteNameViewController.h"

@interface PoetTableViewController ()

@end

@implementation PoetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //    self.view.backgroundColor = [UIColor blackColor];
    self.title = self.authorName;

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //打开即加载
    [self loadNewData];
    
    //自动进入刷新状态
    [self.tableView.header beginRefreshing];
    
    //加载下拉刷新
    __block PoetTableViewController * weakself = self;
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
            PoetModel * pote = [[PoetModel alloc] initWithDictionary:dict];
            [self.dataArray addObject:pote];
            
        }
        //刷新当前页面
        [self.tableView reloadData];
        if (self.dataArray.count == [dic[@"total"] intValue]) {
            [self.tableView removeFooter];
        }
    } fail:^BOOL(NSError *error) {
        return YES;
    }];
    NSString * urlstr = [NSString stringWithFormat:@"http://www.wongsimon.com:8888/ipoem/poemhandler?lcode=zh-Hans&version=2.0&method=poemlist&authorid=%@&key=&pageSize=20&pageIndex=0", self.authorid];
    NSString * str = [urlstr stringByReplacingOccurrencesOfString:@"pageIndex=0" withString:@"pageIndex=%ld"];
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //设置cell样式
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    if (self.dataArray.count > 0) {
        cell.textLabel.text = ((PoetModel *)self.dataArray[indexPath.row]).Title;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PoteNameViewController * poteNameVC = [[PoteNameViewController alloc] init];
    poteNameVC.poteModel = (PoetModel *)(self.dataArray[indexPath.row]);
    [self.navigationController pushViewController:poteNameVC animated:YES];
}


@end
