//
//  MineViewController.m
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/1.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "MineViewController.h"
#import "SettingTableViewController.h"
#import "WriteViewController.h"
#import "WriteHelp.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的写作";
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStylePlain target:self action:@selector(nva_addResult)];
    self.navigationItem.leftBarButtonItem= leftItem;
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings"] style:UIBarButtonItemStylePlain target:self action:@selector(settingAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    NSString *DOUCU =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *PATH =[DOUCU stringByAppendingPathComponent:@"DATA.PLIST"];
    self.dataArray = [NSMutableArray arrayWithContentsOfFile:PATH];
    [self.dataArray writeToFile:PATH atomically:YES];
    
}
//添加
- (void)nva_addResult{
    WriteViewController * writeVC = [[WriteViewController alloc] init];
    UINavigationController * nva = [[UINavigationController alloc] initWithRootViewController:writeVC];
    nva.navigationBar.barStyle = UIBarStyleBlack;
    [self presentViewController:nva animated:YES completion:^{
        writeVC.mineVC = self;
    }];
}
//设置
- (void)settingAction{
    
    SettingTableViewController * settingVC = [[SettingTableViewController alloc] init];
    
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    for (NSDictionary * dic in self.dataArray) {
        cell.textLabel.text = dic[@"note"];
    }
 return cell;
 }
//
////归档
//-(void)archiveMethod
//{
//    //创建一个data容器
//    NSMutableData * data = [NSMutableData dataWithCapacity:1];
//    //创建一个归档器
//    NSKeyedArchiver * keyedArchiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
//    //归档
//    [keyedArchiver encodeObject:_dataArray forKey:@"Array"];
//    [keyedArchiver finishEncoding];
//    [data writeToFile:[@"writrHistory" documentsFilePath] atomically:YES];
//}
//
//-(void)unarchiverMethod
//{
//    self.dataArray = nil;
//    //文件路径
//    NSString * filePath = [@"writrHistory" documentsFilePath];
//    //读取data
//    NSMutableData * data = [NSMutableData dataWithContentsOfFile:filePath];
//    //解档器
//    NSKeyedUnarchiver * keyedUnarchiver  = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
//    //解档
//    _dataArray = [keyedUnarchiver decodeObjectForKey:@"Array"];
//
//}


@end
