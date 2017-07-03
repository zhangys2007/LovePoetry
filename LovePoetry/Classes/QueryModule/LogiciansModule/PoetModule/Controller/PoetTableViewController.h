//
//  PoetTableViewController.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/7.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PoetTableViewController : UITableViewController

@property (nonatomic, strong)NSNumber * authorid;
@property (nonatomic, copy)NSString * authorName;
@property (nonatomic, strong)NSMutableArray * dataArray;
@property (nonatomic, assign)NSInteger pageNum;

- (void)loadDataWithPage:(NSInteger)pageNumber;

@end
