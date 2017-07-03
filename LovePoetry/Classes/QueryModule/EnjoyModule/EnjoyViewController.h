//
//  EnjoyViewController.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/7.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EnjoyModel;
@interface EnjoyViewController : UIViewController
@property (nonatomic, strong)EnjoyModel * enjoyModel;
@property (nonatomic, copy)NSString * nameString;
@property (nonatomic, copy)NSString * answerString;

@end
