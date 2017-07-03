//
//  LogiciansModel.h
//  LovePoetry
//
//  Created by lanou3g on 15/7/4.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogiciansModel : NSObject

@property (nonatomic, copy)NSString * AuthorDescription;
@property (nonatomic, strong)NSNumber * AuthorID;
@property (nonatomic, copy)NSString * AuthorName;
@property (nonatomic, strong)NSNumber * PoemCount;


- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
