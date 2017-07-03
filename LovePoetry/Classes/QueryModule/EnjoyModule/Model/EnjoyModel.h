//
//  EnjoyModel.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/4.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EnjoyModel : NSObject

@property (nonatomic, copy)NSString * Answer;
@property (nonatomic, copy)NSString * Author;
@property (nonatomic, copy)NSString * CDate;
@property (nonatomic, strong)NSNumber * FID;
@property (nonatomic, copy)NSString * Question;
@property (nonatomic, strong)NSNumber * Type;
@property (nonatomic, copy)NSString * UDate;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
