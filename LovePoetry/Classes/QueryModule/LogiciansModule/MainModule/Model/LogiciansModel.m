//
//  LogiciansModel.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/4.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "LogiciansModel.h"

@implementation LogiciansModel
- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.AuthorDescription = dic[@"AuthorDescription"];
        self.AuthorID = dic[@"AuthorID"];
        self.AuthorName = dic[@"AuthorName"];
        self.PoemCount = dic[@"PoemCount"];
    }
    return self;
}
@end
