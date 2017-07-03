//
//  WriteViewController.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/8.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MineViewController;
@interface WriteViewController : UIViewController
@property (nonatomic, strong)MineViewController * mineVC;
@property (nonatomic, strong)NSDictionary * write;
@property (nonatomic, strong)NSMutableArray * dataArray;
@end
