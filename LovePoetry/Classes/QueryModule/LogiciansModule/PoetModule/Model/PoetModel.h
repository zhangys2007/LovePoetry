//
//  PoetModel.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/7.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PoetModel : NSObject

@property (nonatomic, copy)NSString * Title;
@property (nonatomic, copy)NSString * Body;
@property (nonatomic, copy)NSString * Appreciation;
@property (nonatomic, strong)NSNumber * PoemID;
@property (nonatomic, copy)NSString * PubAges;
@property (nonatomic, copy)NSString * AuthorName;
@property (nonatomic, copy)NSString * WordNote;
@property (nonatomic, copy)NSString * Translation;
@property (nonatomic, strong)NSNumber * AuthorID;
@property (nonatomic, copy)NSString * PoemEra;
@property (nonatomic, strong)NSNumber * Type;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
