//
//  MeterModel.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/4.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeterModel : NSObject

@property (nonatomic, copy)NSString * Intro;
@property (nonatomic, copy)NSString * Melody;
@property (nonatomic, copy)NSString * MelodyNote;
@property (nonatomic, strong)NSNumber * MemID;
@property (nonatomic, copy)NSString * Name;
@property (nonatomic, copy)NSString * NameDetail;
@property (nonatomic, copy)NSString * NickName;
@property (nonatomic, copy)NSString * Sample;

- (instancetype)initWithDictionary:(NSDictionary *)dic;


@end
