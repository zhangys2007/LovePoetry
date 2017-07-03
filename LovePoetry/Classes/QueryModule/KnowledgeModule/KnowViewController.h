//
//  KnowViewController.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/7.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KonwledgeModel;
@interface KnowViewController : UIViewController
@property (nonatomic, strong)KonwledgeModel * konwLedgeModel;
@property (nonatomic, strong)NSString * questionString;
@property (nonatomic, strong)NSString * answerString;
@end
