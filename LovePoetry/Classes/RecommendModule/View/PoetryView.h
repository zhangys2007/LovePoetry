//
//  PoetryView.h
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/2.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PoetryModel;
@interface PoetryView : UIScrollView

@property (nonatomic, strong)UILabel * poetryNameLable;
@property (nonatomic, strong)UILabel * writerLable;
@property (nonatomic, strong)UIImageView * imageView;
@property (nonatomic, strong)UILabel * poetryLable;
@property (nonatomic, strong)UILabel * noteLable;

@property (nonatomic, strong)UILabel * lable;
@property (nonatomic, strong)UIImageView * lineImage;
@property (nonatomic, strong)UIView * noteView;

@property (nonatomic, strong)PoetryModel * model;


@end
