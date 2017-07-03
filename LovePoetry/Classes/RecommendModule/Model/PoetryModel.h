//
//  PoetryModel.h
//  LovePoetry
//
//  Created by 张阳帅 on 15/7/2.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PoetryModel : NSObject


@property (nonatomic, copy)NSString * Appreciation;
@property (nonatomic, copy)NSString * Article;
@property (nonatomic, strong)NSNumber * ArtID;
@property (nonatomic, copy)NSString * Author;
@property (nonatomic, copy)NSString * CDate;
@property (nonatomic, strong)NSNumber * FistIndex;
@property (nonatomic, copy)NSString * ImgSrc;
@property (nonatomic, copy)NSString * PDate;
@property (nonatomic, copy)NSString * PubAges;
@property (nonatomic, strong)NSNumber * RightCount;
@property (nonatomic, copy)NSString * Title;
@property (nonatomic, copy)NSString * UDate;
@property (nonatomic, strong)NSNumber * WrongCount;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
