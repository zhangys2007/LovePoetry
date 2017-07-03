//
//  EnjoyModel.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/4.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "EnjoyModel.h"

@implementation EnjoyModel
- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.Answer = dic[@"Answer"];
        self.Author = dic[@"Author"];
        self.CDate = dic[@"CDate"];
        self.FID = dic[@"FID"];
        self.Question = dic[@"Question"];
        self.Type = dic[@"UDate"];
        self.UDate = dic[@"UDate"];
    }
    return self;
}
@end
