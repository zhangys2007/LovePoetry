//
//  LogiciansTableViewController.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/4.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogiciansTableViewController : UITableViewController

@property (nonatomic, copy)NSString * URLString;
@property (nonatomic, assign)NSInteger pageNum;
@property (nonatomic, strong)NSMutableArray * dataArray;

- (void)loadDataWithPage:(NSInteger)pageNumber;
@end
