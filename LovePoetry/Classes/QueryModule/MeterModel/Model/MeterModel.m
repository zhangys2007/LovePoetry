//
//  MeterModel.m
//  LovePoetry
//
//  Created by lanou3g on 15/7/4.
//  Copyright (c) 2015年 张阳帅. All rights reserved.
//

#import "MeterModel.h"

@implementation MeterModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.Intro = dic[@"Intro"];
        self.Melody = dic[@"Melody"];
        self.MelodyNote = dic[@"MelodyNote"];
        self.MemID = dic[@"MemID"];
        self.Name = dic[@"Name"];
        self.NameDetail = dic[@"NameDetail"];
        self.Sample = dic[@"Sample"];
    }
    return self;
}

@end
