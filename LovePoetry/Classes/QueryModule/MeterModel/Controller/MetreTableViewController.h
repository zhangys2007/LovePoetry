//
//  PublicTableViewController.h
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/3.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MetreTableViewController : UITableViewController

@property (nonatomic, copy)NSString * URLString;
@property (nonatomic, assign)NSInteger pageNum;
@property (nonatomic, strong)NSMutableArray * dataArray;

- (void)loadDataWithPage:(NSInteger)pageNumber;
@end
